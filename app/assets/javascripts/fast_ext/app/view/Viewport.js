Ext.define('FastExt.view.Viewport', {
    extend:'Ext.container.Viewport',
    id:'port',
    layout:'border',

    items:[
        {
            height:43,
            html:"<div class=\'fast-ext-header\'><span class=\'caption\'>"+ app_project +"</span><span class=\'version\'>("+ app_version +")</span></div>",
            region:"north",
            split:true,
            xtype:"component"
        },
        {
            region:"west",
            activeTab:0,
            collapseMode:"mini",
            collapsible:true,
            split:true,
            width:295,
            defaults:{border:false},
            items:[Ext.create('FastExt.view.VMenu'),{title:'Help',iconCls:'fast-ext-btn-help'}],
            xtype:"tabpanel"
        },
        {
            region:"south",
            border:false,
            height:28,
            items:[{xtype:"tbfill"},{style:"font-weight:bold",text:app_copyright ,xtype:"tbtext"}],
            xtype:"toolbar"
        },
        {
            id:'mycenter',
               region: 'center',
               xtype: 'tabpanel', // TabPanel itself has no title
               activeTab: 0,      // First tab active by default
            //maskOnDisable: false,

               items: [{
                   title: 'Home',
                   iconCls:'fast-ext-home',
                   border:false,

                   html: 'The first tab\'s content. Others may be added dynamically'
               }]
        }
    ],
    listeners: {
        afterrender: function() {
            var mask = Ext.get('fast-ext-loading');
            mask.fadeOut({callback: function(){ mask.destroy(); }});
        }
    }
});

