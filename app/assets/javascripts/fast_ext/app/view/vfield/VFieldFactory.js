Ext.define('FastExt.view.vfield.VFieldFactory', {
    singleton: true,

    VType: {
        VText: 'FastExt::MText',
        VTree: 'FastExt::MTree',
        VDate: 'FastExt::MDate',
        VHtmlEditor: 'FastExt::MHtmlEditor',
        VCombobox: 'FastExt::MCombobox',
        VMultiCombobox: 'FastExt::MMultiCombobox',
        VLongCombobox: 'FastExt::MLongCombobox',
        VTextArea: 'FastExt::MTextArea',
        VNumber: 'FastExt::MNumber',
        VCheckbox: 'FastExt::MCheckbox',
        VCheckboxGroup: 'FastExt::MCheckboxGroup',
        VSexSelect: 'FastExt::MSexSelect',
        VFile: 'FastExt::MFile',
        VYesOrNo: 'FastExt::MYesOrNo',
        VGridColumnXtypeCombo: 'FastExt::MGridColumnXtypeCombo',
        VList: 'FastExt::MList',
        VLookup: 'FastExt::MRelation'
    },

    buildField: function (field, winCtx, winId, rest) {
        field.datatype = field.datatype || '';
        //field.rest = rest;
        switch (field.datatype) {
            case 'VString':
                return Ext.create('FastExt.view.vfield.VString', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VTreeText':
                return Ext.create('FastExt.view.vfield.VTreeText', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VDate':
                return Ext.create('FastExt.view.vfield.VDate', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VHtml':
                return Ext.create('FastExt.view.vfield.VHtml', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VSingleChoice':
                return Ext.create('FastExt.view.vfield.VSingleChoice', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VMultipleChoice':
                return Ext.create('FastExt.view.vfield.VMultipleChoice', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VRadio':
                return Ext.create('FastExt.view.vfield.VRadio', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VText':
                return Ext.create('FastExt.view.vfield.VText', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VNumber':
                return Ext.create('FastExt.view.vfield.VNumber', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VInteger':
                return Ext.create('FastExt.view.vfield.VInteger', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VBoolean':
                return Ext.create('FastExt.view.vfield.VBoolean', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VCheckbox':
                return Ext.create('FastExt.view.vfield.VCheckbox', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VSexSelect':
                return Ext.create('FastExt.view.vfield.VSexSelect', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VFile':
                return Ext.create('FastExt.view.vfield.VFile', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VYesOrNo':
                return Ext.create('FastExt.view.vfield.VYesOrNo', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VList':
                return Ext.create('FastExt.view.vfield.VList', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VLookup':
                return Ext.create('FastExt.view.vfield.VLookup', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VTable':
                return Ext.create('FastExt.view.vfield.VTable', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VTree':
                return Ext.create('FastExt.view.vfield.VTree', {valueObject: field, winCtx: winCtx, winId: winId, rest: rest});

            case 'VGroup':
                var box = Ext.create('Ext.form.FieldSet',{
                    title: field.title,
                    collapsible: true,
                    defaults: {
                        labelWidth: 89,
                        layout: {
                            type: 'hbox',
                            defaultMargins: {top: 0, right: 0, bottom: 5, left: 0}
                        }
                    },
                    defaultType: 'textfield'
                });
                Ext.each(field.members, function(member){
                    box.add(this.buildField(member, winCtx, winId, rest));
                },this);
                return box;

            default:
                if(Array.isArray(field)){
                    var line = Ext.create('Ext.container.Container', {
                        layout: 'hbox',
                        margin: '0 0 5 0',
                        defaultType: 'textfield'
                    });
                    Ext.each(field, function(f){
                        line.add(this.buildField(f, winCtx, winId, rest));
                    },this);
                    return line;
                }

        }
    }
});
