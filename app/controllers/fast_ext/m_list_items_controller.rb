# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MListItemsController < ApplicationController
    before_action :set_m_list_item, only: [:show, :edit, :update, :destroy]
    respond_to :html, :xml, :json
    def index
      list = MList.where({
                                  :name => params[:list_name]
                              }.delete_if {|k, v| v.blank? })

      @m_list_items = MListItem.where({
                                          :m_list_id => params[:m_list_id] || list
                                      }.delete_if {|k, v| v.blank? })
      #data = paginate(@m_list_items)
      respond_with(@m_list_items.to_json(:include =>[:m_list,:createdbyorg,:createdby,:updatedby]))
    end

    def show
      #@m_list_item = MListItem.find(params[:id])
      respond_with(@m_list_item)
    end

    def edit
      #@m_list_item = MListItem.find(params[:id])
      respond_with(@m_list_item.to_json(:include => [:m_list]))
    end

    def new
      @m_list_item = MListItem.new
      respond_with(@m_list_item)
    end

    def create
      @m_list_item = MListItem.new(m_list_item_params)
      respond_with(@m_list_item) do |format|
        if @m_list_item.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      #@m_list_item = MListItem.find(params[:id])

      respond_with(@m_list_item) do |format|
        if @m_list_item.update_attributes(m_list_item_params)
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_list_item = MListItem.find(params[:id])
      @m_list_item.destroy
      respond_with(@m_list_item)
    end

    private
    def set_m_list_item
      @m_list_item = MListItem.find(params[:id])
    end

    def m_list_item_params
      params[:m_list_item].permit!
    end

  end
end