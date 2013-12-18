Ext.define('FastExt.view.vfield.VList', {
    extend:'Ext.form.field.ComboBox',
    requires:['FastExt.store.MListMgr'],
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    valueField:'name',
    displayField:"title",
    forceSelection:true,
    triggerAction:'all',
    editable:false,
    selectOnFocus:true,

    initComponent:function () {
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('name') + ']';
        this.disabled = this.getFValue('readonly') || false;
        this.allowBlank = this.getFValue('required') || true;
        this.width = this.getFValue('field_width') || 650;
        this.vtype = this.getFValue('vtype');
        this.store = FastExt.store.MListMgr.getStore(this.getFValue('name'));
        this.callParent();
    },
    getFValue:function (key) {
        return this.valueObject[key];
    },
    setValue:function (value) {
        if(value && value.name && value.title){
            this.setValue(value.name);
        }else{
            this.callParent(arguments);
        }
    }

});