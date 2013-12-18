Ext.define('FastExt.view.FormFactory', {
    singleton: true,

    createForm: function (form_kind, tab) {
        if (form_kind == '') {
            return Ext.create('FastExt.view.VForm', {tab: tab});
        } else {
            return Ext.create('FastExt.view.' + form_kind, {tab: tab});
        }
    }
});