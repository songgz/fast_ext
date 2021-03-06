Ext.define('FastExt.view.vfield.VTree', {
    extend:'Ext.form.field.ComboBox',
    alias:'widget.vtreetable',
    valueObject: {},
    winCtx:{},
    winId:0,
    rest:{},

    editable: false,
    displayField:'title',
    valueField:'id',
    initComponent:function () {
        this.fieldLabel = this.getFValue('title');
        this.name =  this.rest.getTableName() + '[' + this.getFValue('name') + ']';
        this.disabled = this.getFValue('readonly') || false;
        this.allowBlank = this.getFValue('required') || true;
        this.width = this.getFValue('field_width') || 650;
        this.vtype = this.getFValue('vtype');
        this.store = Ext.create('Ext.data.ArrayStore', {
            fields:['id', 'title'],
            data:[]
        });
        this.callParent();
    },
    createPicker: function() {
        var rest = Ext.create('FastExt.view.Rest', this.getMEntity());
        return Ext.create('Ext.tree.Panel', {
            hidden: true,
            floating: true,
            minHeight: 300,
            autoScroll: true,
            store: Ext.create('Ext.data.TreeStore', {
                fields:['id', {name:'text', mapping:'title'}],
                autoLoad: true,
                proxy:{
                    type: 'ajax',
                    url: rest.indexPath(),
                    reader:{
                        type:'json',
                        root:'',
                        record:''
                        //successProperty:''
                    }
                },
                root: {
                    text:'Root',
                    id:'',
                    expanded: true
                }
            }),
            listeners: {
                itemclick: function (view, record) {
                    var id = record.get('id');
                    if (!this.store.getById(id)){
                        this.store.add({id:id,title:record.get('text')});
                    }
                    this.setValue(id);
                    this.collapse();
                },
                scope:this
            }
        });
    },
    getMEntity:function(){
        return this.valueObject.ref.entity;
    },
    getFValue:function (key) {
        return this.valueObject[key];
    },
    setValue:function(value){
        if(value && value.id && value.title){
            this.store.add(value);
            this.setValue(value.id);
        }else{
            this.callParent(arguments);
        }
    }
});