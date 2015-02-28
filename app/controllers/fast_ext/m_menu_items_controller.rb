# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MMenuItemsController < ApplicationController
    before_action :set_m_menu_item, only: [:show, :edit, :update, :destroy]
    respond_to :html, :xml, :json

    def index
      if params[:node] == 'root'
        @m_menu_items = MMenuItem.roots.where({:m_menu_id => params[:m_menu_id]}.delete_if { |k, v| v.blank? })
      else
        @m_menu_items = MMenuItem.where({:parent_id => params[:node]}.delete_if { |k, v| v.blank?})
        #@m_menu_items = paginate(@items)
      end
      respond_with(@m_menu_items.to_json(:include => [:m_menu, :createdbyorg, :createdby, :updatedby], :methods => [:leaf, :expanded]))
    end

    def show
      #@m_menu_item = MMenuItem.find(params[:id])
      respond_with(@m_menu_item)
    end

    def edit
      #@m_menu_item = MMenuItem.find(params[:id])
      respond_with(@m_menu_item.to_json(:include => [:m_menu, :createdbyorg, :createdby, :updatedby]))
    end

    def new
      @m_menu_item = MMenuItem.new
      respond_with(@m_menu_item)
    end

    def create
      @m_menu_item = MMenuItem.new(m_menu_item_params)
      respond_with(@m_menu_item) do |format|
        if @m_menu_item.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      #@m_menu_item = MMenuItem.find(params[:id])

      respond_with(@m_menu_item) do |format|
        if @m_menu_item.update_attributes(m_menu_item_params)
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      #@m_menu_item = MMenuItem.find(params[:id])
      @m_menu_item.destroy
      respond_with(@m_menu_item)
    end

    private
    def set_m_menu_item
      @m_menu_item = MMenuItem.find(params[:id])
    end

    def m_menu_item_params
      params[:m_menu_item].permit!
    end


  end
end