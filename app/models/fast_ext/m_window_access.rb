# encoding: utf-8
module FastExt
  class MWindowAccess < MObject
    #attr_accessible :m_dept_id,:m_org_id,:m_role_id,:window

    belongs_to :m_role, :class_name => 'FastExt::MRole'
  end
end
