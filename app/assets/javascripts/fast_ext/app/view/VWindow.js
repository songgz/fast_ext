Ext.define('FastExt.view.VWindow', {
    extend:'Ext.TabPanel',
    requires:['FastExt.Env'],
    alias:'widget.vwindow',
    valueObject: {},
    activeTab: 0,
    closable: true,
    tabPosition: 'left',
    tabRotation: 0,
    border:true,

    initComponent:function(){
        this.winCtx = FastExt.Env.getCtx();
        this.title = this.getValue('title');
        this.subs = [];
        this.callParent();
    },
    getValue:function(key){
        return this.valueObject[key];
    },
    getTabValues:function(){
        return this.valueObject.tabs;
    },
    listeners:{
        afterrender: function(vwindow, opts) {

        },
        beforerender:function (vwindow, opts) {
            this.loadTabs(vwindow, opts);
        }
    },
    loadTabs:function (vwindow, opts) {
        //vwindow.getSubTabs(0,'');
        Ext.each(vwindow.getTabValues(), function (mtab) {
            var vTab = Ext.create('FastExt.view.VTab', {
                valueObject: mtab,
                winId:vwindow.id,
                winCtx: vwindow.winCtx
            });
            vwindow.add(vTab);
        });
        vwindow.setActiveTab(0);
    },
    getSubTabs:function(pid,level){
        Ext.each(this.getTabValues(),function(tab){
            if(tab.included_tab == pid){
                tab.level =  level;
                this.subs.push(tab);
                this.getSubTabs(tab.id,level + '　');
            }
        },this);
    }
});

