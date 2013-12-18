# encoding: utf-8
module FastExt
  class MListItem < MObject
    #attr_accessible :m_list,:m_list_id

    belongs_to :m_list, :class_name => 'FastExt::MList'

  end
end
