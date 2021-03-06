Ext.define('FastExt.view.vfield.VBoolean',{
    extend: 'Ext.form.field.Checkbox',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    inputValue: 'true',
    uncheckedValue: 'false',
    initComponent:function(){
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('name') + ']';
        this.disabled = this.getFValue('readonly') || false;
        this.allowBlank = this.getFValue('required') || true;
        this.width = this.getFValue('field_width') || 650;
        this.vtype = this.getFValue('vtype');
        this.callParent();
    },
    getFValue:function (key) {
        return this.valueObject[key] || '';
    }
});