# encoding: utf-8
module FastExt
  class MOrgAccess < MObject
    #attr_accessible :m_dept_id,:m_org_id,:m_role_id

    belongs_to :m_role, :class_name => 'FastExt::MRole'
    belongs_to :m_dept, :class_name => 'FastExt::MDept'
    belongs_to :m_org, :class_name => 'FastExt::MOrg'
  end
end
