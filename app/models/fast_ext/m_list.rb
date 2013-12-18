# encoding: utf-8
module FastExt
  class MList < MObject

    has_many :m_list_items, :class_name => 'FastExt::MListItem'
  end
end
