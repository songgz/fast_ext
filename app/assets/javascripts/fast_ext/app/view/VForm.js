Ext.define('FastExt.view.VForm', {
    extend: 'Ext.form.Panel',
    requires: ['FastExt.view.vfield.VFieldFactory'],
    tab: {},
    successText:'Success',
    failureText:'Failed',
    invalidText:'Invalid',

    autoScroll: true,
    bodyPadding: 5,
    layout: 'anchor',
    fieldDefaults: {
        labelAlign: 'right',
        labelWidth: 100,
        //anchor: '60%'
        width: 650
    },
    defaultType: 'textfield',
    border: false,
    initComponent: function () {
        this.title = this.getValue('title');
        this.items = this.getFFields();
        this.callParent();
    },
    getValue: function (key) {
        return this.tab.valueObject[key];
    },
    getMEntity: function () {
        return this.tab.valueObject.entity;
    },
    getFFields: function () {
        var fields = [];
        Ext.each(this.getValue('members'), function (member) {
            member.readonly = member.readonly || false;
            member.display = member.display || 'all';
            member.vtype = member.vtype || '';

            if (member.display == 'all' || member.display == 'form') {
                fields.push(FastExt.view.vfield.VFieldFactory.buildField(member, this.tab.winCtx, this.tab.winId, this.tab.rest));
            }
        }, this);
        return fields;
    },
    cmdCreate: function () {
        var form = this.getForm();
        form.url = this.tab.rest.createPath();
        form.method = 'POST';
        form.reset();
        this.setAutoFields(form);  //  有数据时要进行测试
    },
    setAutoFields: function (form) {
        var temp = {};
        var logic = "";
        Ext.each(this.getValue('members'), function (member) {
            if (member.default_logic) {
                logic = this.tab.winCtx.parseCtx(this.tab.winId, member.default_logic);
                temp[this.tab.rest.getTableName() + '[' + member.name + ']'] = Ext.decode(logic);
            }
        }, this);
        form.setValues(temp);
    },
    cmdEdit: function () {
        var id = this.tab.getVGrid().selectedId();
        var form = this.getForm();
        form.url = this.tab.rest.updatePath(id);
        form.method = 'PUT';
        this.setEditValues(id, form);
    },
    setEditValues: function (id, form) {
        Ext.Ajax.request({
            url: this.tab.rest.editPath(id),
            success: function (response) {
                var data = Ext.decode(response.responseText);
                var k, o = {};
                for (k in data) {
                    if (k.match(/_id$/)) {
                        var attr = data[k.replace('_id', '')] || data[k];
                        o[this.tab.rest.getTableName() + '[' + k + ']'] = attr;
                    } else if (k.match(/_ids$/)) {
                        o[this.tab.rest.getTableName() + '[' + k + '][]'] = data[k];
                    }
                    else {
                        o[this.tab.rest.getTableName() + '[' + k + ']'] = data[k];
                    }
                }
//                alert(Ext.encode(o));
                form.setValues(o);
            },
            failure: function (response,action) {
                Ext.Msg.alert(this.failureText, action.result.msg);
            },
            scope: this
        });
    },
    cmdSave: function () {
        var form = this.getForm();
        if (form.isValid()) { // make sure the form contains valid data before submitting
            form.submit({
                success: function (form, action) {
                    this.tab.vgrid.refresh();
                    Ext.Msg.alert(this.successText, action.result.msg);
                },
                failure: function (form, action) {
                    Ext.Msg.alert(this.failureText, action.result.msg);
                },
                scope: this
            });
        } else { // display error alert if the data is invalid
            Ext.Msg.alert(this.invalidText, 'Please correct form errors.')
        }
    }
});