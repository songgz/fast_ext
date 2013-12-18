Ext.Loader.setConfig({
    enabled:true,
    paths:{
        'Ext.ux':'/assets/fast_ext/extjs4/ux'
    }
});

Ext.application({
    // the global namespace
    name:'FastExt',
    appFolder:'/assets/fast_ext/app',




    launch: function() {

        //Ext.Viewport.setMasked(false);
//        var win;
//        if(!win){
//            win = Ext.create('FastExt.view.VLoginWindow').show();
//        }
    },
    autoCreateViewport:true
});