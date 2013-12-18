# encoding: utf-8
module FastExt
  class MPersonRole < MObject
    #attr_accessible :m_person_id, :m_role_id

    belongs_to :m_role, :class_name => 'FastExt::MRole'
    belongs_to :m_person, :class_name => 'FastExt::MPerson'
  end
end
