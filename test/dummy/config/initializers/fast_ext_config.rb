# encoding: utf-8
FastExt::View.instance.config do |conf|
  conf.project = 'FastExt Rapid Development Framework'
  conf.version = "version #{FastExt::VERSION} built on ExtJS 5.0.1"
  conf.copyright = 'Copyright 2013-2014 sgzhe@163.com.'

  default = [
      {name: 'entity_kind', title: '实体种类', datatype: 'VRadio'},
      {name: 'seq', title: '排序', datatype: 'VInteger'},
      {name: 'is_active', title: '是否激活', datatype: 'VBoolean'},
      {name: 'note', title: '备注', datatype: 'VText'},
      {name: 'createdbyorg_id', title: '创建组织', datatype: 'VTable', ref: {entity: 'FastExt::MOrg'},display: 'grid'},
      {name: 'createdby_id', title: '创建人', datatype: 'VLookup', ref: {entity: 'FastExt::MPerson'}, display: 'grid'},
      {name: 'updatedby_id', title: '更新人', datatype: 'VLookup', ref: {entity: 'FastExt::MPerson'}, display: 'grid'}
  ]

  conf.win :m_menu, title: '菜单', window_kind: 'maintain' do |w|
    w.tab :m_menu, title: '菜单', entity: 'FastExt::MMenu', readonly: true, members: [
        {name: 'id', title: 'ID', datatype: 'VInteger', readonly: true},
        {name: 'title', title: '标题', datatype: 'VString'},
        {name: 'print_text', title: '打印文本', datatype: 'VString'},
        {name: 'name', title: '标识', datatype: 'VString'}
    ] + default
    w.tab :m_menu_item, title: '菜单项', entity: 'FastExt::MMenuItem', included_tab: 'm_menu', grid_kind: 'VTreeGrid', members: [
        {name: 'id', title: 'ID', datatype: 'VInter', readonly: true},
        {name: 'title', title: '标题', datatype: 'VTreeText'},
        {name: 'print_text', title: '打印文本', datatype: 'VString'},
        {name: 'name', title: '标识', datatype: 'VString'},
        {name: 'm_menu_id', title: '对应菜单', datatype: 'VLookup', ref: {entity: 'FastExt::MMenu'}, default_logic: "{id:${m_menu_id},title:'${m_menu_title}'}"},
        {name: 'window', title: '对应窗口', datatype: 'VString'},
        {name: 'parent_id', title: '上级组织', datatype: 'VTree', ref: {entity: 'FastExt::MMenuItem'}}
    ] + default
  end

  conf.win :m_org, title: '组织', window_kind: 'maintain' do |w|
    w.tab :m_org, title: '组织', entity: 'FastExt::MOrg', grid_kind: 'VTreeGrid', members: [
        {name: 'id', title: 'ID', datatype: 'VInteger', readonly: true, },
        {name: 'title', title: '名称', datatype: 'VTreeText'},
        {name: 'print_text', title: '打印文本', datatype: 'VString'},
        {name: 'name', title: '标识', datatype: 'VString'},
        {name: 'parent_id', title: '上级组织', datatype: 'VTree', ref: {entity: 'FastExt::MOrg'}, default_logic: "{id:${m_org_id},title:'${m_org_title}'}"}
    ] + default
  end

  conf.win :m_person, title: '人员', window_kind: 'maintain' do |w|
    w.tab :m_person, title: '人员', entity: 'FastExt::MPerson', members: [
        {name: 'id', title: 'ID', datatype: 'VInteger', readonly: true},
        {name: 'title', title: '标题', datatype: 'VString', column_width: 200, field_width: 200},
        {name: 'print_text', title: '打印文本', datatype: 'VString', vtype:'url'},
        {name: 'name', title: '标识', datatype: 'VString'},
        {name: 'access_level', title: '访问级别', datatype: 'VList'}
    ] + default
  end

  conf.win :m_role, title:'角色', window_kind: 'maintain' do |w|
    w.tab :m_role, title: '角色', entity: 'FastExt::MRole', members: [
        {name: 'id', title: 'ID', datatype: 'VInteger', readonly: true},
        {name: 'title', title: '标题', datatype: 'VString'},
        {name: 'print_text', title: '打印文本', datatype: 'VString'},
        {name: 'name', title: '标识', datatype: 'VString'},
        {name: 'access_level', title: '访问级别', datatype: 'VList'},
        {name: 'm_menu_id', title: '菜单', datatype: 'VTable', ref: {entity: 'FastExt::MMenu'}}

    ] + default
    w.tab :m_person_role, title: '角色分配', entity: 'FastExt::MPersonRole', included_tab: 'm_role', members: [
        {name: 'id', title: 'ID', datatype: 'VInteger', readonly: true},
        {name: 'title', title: '标题', datatype: 'VString'},
        {name: 'print_text', title: '打印文本', datatype: 'VString'},
        {name: 'name', title: '标识', datatype: 'VString'},
        {name: 'm_person_id', title: '人员', datatype: 'VLookup',  ref: {entity: 'FastExt::MPerson'}},
        {name: 'm_role_id', title: '角色', datatype: 'VTable', ref: {entity: 'FastExt::MRole'}}
    ] + default
    w.tab :m_org_access, title: '组织访问', entity: 'FastExt::MOrgAccess', included_tab: 'm_role', members: [
        {name: 'id', title: 'ID', datatype: 'VInteger', readonly: true},
        {name: 'title', title: '标题', datatype: 'VString'},
        {name: 'print_text', title: '打印文本', datatype: 'VString'},
        {name: 'name', title: '标识', datatype: 'VString'},
        {name: 'm_org_id', title: '组织', datatype: 'VLookup', ref: {entity: 'FastExt::MOrg'}},
        {name: 'm_role_id', title: '角色', datatype: 'VTable', ref: {entity: 'FastExt::MRole'}}
    ] + default
    w.tab :m_window_access, title: '窗口访问', entity: 'FastExt::MWindowAccess', included_tab: 'm_role', members: [
        {name: 'id', title: 'ID', datatype: 'VInteger', readonly: true},
        {name: 'title', title: '标题', datatype: 'VString'},
        {name: 'print_text', title: '打印文本', datatype: 'VString'},
        {name: 'name', title: '标识', datatype: 'VString'},
        {name: 'window', title: '窗口', datatype: 'VString'},
        {name: 'm_role_id', title: '角色', datatype: 'VTable', ref: {entity: 'FastExt::MRole'}}
    ] + default
  end

  conf.win :m_list, title: '数据字典', window_kind: 'maintain' do |w|
    w.tab :m_list, title: '枚举', entity: 'FastExt::MList', members: [
        {name: 'id', title: 'ID', datatype: 'VInteger', readonly: true},
        {name: 'title', title: '标题', datatype: 'VString'},
        {name: 'print_text', title: '打印文本', datatype: 'VString'},
        {name: 'name', title: '标识', datatype: 'VString'}
    ] + default
    w.tab :m_list_item, title: '枚举项', entity: 'FastExt::MListItem', included_tab: 'm_list', members: [
        {name: 'id', title: 'ID', datatype: 'VInteger', readonly: true},
        {name:'title', title: '标题', datatype:'VString'},
        {name:'print_text', title: '打印文本', datatype:'VString'},
        {name: 'name', title: '标识', datatype: 'VString'},
        {name: 'm_list_id', title: '所属枚举', datatype: 'VLookup', ref: {entity: 'FastExt::MList'}}
    ] + default
  end

  conf.win :m_help, title: '帮助', window_kind: 'maintain' do |w|
    w.tab :m_help, title: '帮助', entity: 'FastExt::MHelp', members: [
        {name: 'id', title: 'ID', datatype: 'VInteger', readonly: true},
        {name: 'title', title: '标题', datatype: 'VString', column_width: 200, field_width: 200},
        {name: 'print_text', title: '打印文本', datatype: 'VString', vtype:'url'},
        {name: 'name', title: '标识', datatype: 'VString'},
        {name: 'desc', title: '描述', datatype: 'VHtml', display: 'form'}
    ] + default
  end

end