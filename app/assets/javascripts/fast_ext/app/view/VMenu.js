Ext.define('FastExt.MenuTree', {
    extend: 'Ext.data.TreeModel',
    fields:['id', {name:'text', mapping:'title'},'leaf','expanded', 'window']
});
Ext.define('FastExt.view.VMenu', {
    extend:'Ext.tree.Panel',
    requires:['FastExt.store.MWindowMgr'],
    alias: 'widget.vMenu',
    title:'Menu',
    animate:false,
    collapseMode:"mini",
    collapsible:true,
    iconCls:"fast-ext-menu",
    lines:false,
    rootVisible:false,
    split:true,
    dockedItems:[{dock:"top",items:[{xtype:"tbfill"},
        {iconCls:"fast-ext-tree-expand",tooltip:"Expand All",xtype:"button", listeners:{click:{fn:function (sender ,e ,eOpts) {sender.up().up().expandAll();}}}},
        {iconCls:"fast-ext-tree-collapse",tooltip:"Collapse All",xtype:"button", listeners:{click:{fn:function (sender ,e ,eOpts) { sender.up().up().collapseAll(); sender.up().up().getRootNode().expand();}}}}],xtype:"toolbar"}
    ],

    initComponent: function(){
      this.store = Ext.create('Ext.data.TreeStore', {
          autoLoad:true,
          model: 'FastExt.MenuTree',
          //fields:['id', {name:'text', mapping:'title'},'leaf','expanded', 'window'],
          proxy:{
              type:'ajax',
              url:'/fast_ext/m_menu_items.json',
              reader:{
                  type:'json'
              }
          },
          root:{
              text:this.title,
              id: 1,
              expanded:true
          }
      });
      this.callParent(arguments);
    },

    listeners:{
        itemclick:function(self, record, item, index, e, eOpts){
            this.loadVWindow(self, record, item, index, e, eOpts);
        }
    },

    loadVWindow:function (self, record, item, index, e, eOpts) {
        var c = Ext.getCmp('mycenter');
        c.setLoading(true);
        var id = record.get('window');
        //var id = 'm_list';


        if (record.get('leaf')) {
            FastExt.store.MWindowMgr.load(id, function (obj) {
                var winId = 'win-' + id;
                var win = Ext.getCmp(winId);
                if (!win) {
                    win = Ext.create('FastExt.view.VWindow', {
                        id: winId,
                        valueObject: obj
                    });
                    c.add(win);
                }
                c.setActiveTab(win);
                c.setLoading(false);
            });
        }

    }
});





