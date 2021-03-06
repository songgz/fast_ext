# encoding: utf-8
module FastExt
  class MObject < ActiveRecord::Base
    self.abstract_class = true

    #attr_accessible :id, :name, :title, :print_text, :note, :entity_kind, :is_active, :seq
    #attr_accessible :createdbyorg_id,:createdbyorg, :createdby_id,:createdby,:updatedby_id,:updatedby

    belongs_to :createdbyorg, :class_name => 'FastExt::MOrg'
    belongs_to :createdby, :class_name => 'FastExt::MPerson'
    belongs_to :updatedby, :class_name => 'FastExt::MPerson'

    #before_create do |mo|
    #  mo.org_id = Env.ctx.get(:g_org_id) || mo.org_id
    #  mo.createdby_id = Env.ctx.get(:g_person_id) || mo.createdby_id
    #  mo.updatedby_id = Env.ctx.get(:g_person_id) || mo.updatedby_id
    #end
    #
    #before_update do |mo|
    #  mo.updatedby_id = Env.ctx.get(:g_person_id) || mo.updatedby_id
    #end

    #opts={name:'',members:'',extends:''}


    class << self
      #def window(opts)
      #  FastExt::View.instance.window(opts)
      #end
      #
      #def tab(opts)
      #  FastExt::View.instance.tab(opts)
      #end

      def ui(&block)
        FastExt::View.instance.config(&block) if block_given?
      end
    end

  end
end
