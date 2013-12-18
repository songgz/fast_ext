# encoding: utf-8
module FastExt
  class MMenu < MObject

    has_many :m_menu_items, :class_name => 'FastExt::MMenuItem'



  end
end
