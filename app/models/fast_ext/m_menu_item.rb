# encoding: utf-8
require_dependency "awesome_nested_set"
module FastExt
  class MMenuItem < MObject
    acts_as_nested_set
    #attr_accessible :m_menu_id, :m_menu, :window, :parent_id

    belongs_to :m_menu, :class_name => 'FastExt::MMenu'

    alias :leaf :leaf?
    alias :expanded :child?

  end
end
