# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MListsController < ApplicationController
    before_action :set_m_list, only: [:show, :edit, :update, :destroy]
    respond_to :html, :xml, :json
    def index
      @m_lists = MList.all
      data = paginate(@m_lists)
      respond_with(data.to_json(:include => [:m_list_items,:createdbyorg, :createdby, :updatedby]))
    end

    def show
      #@m_list = MList.find(params[:id])
      respond_with(@m_list)
    end

    def edit
      #@m_list = MList.find(params[:id])
      respond_with(@m_list)
    end

    def new
      @m_list = MList.new
      respond_with(@m_list)
    end

    def create
      @m_list = MList.new(m_list_params)
      respond_with(@m_list) do |format|
        if @m_list.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      #@m_list = MList.find(params[:id])

      respond_with(@m_list) do |format|
        if @m_list.update_attributes(m_list_params)
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      #@m_list = MList.find(params[:id])
      @m_list.destroy
      respond_with(@m_list)
    end

    private
    def set_m_list
      @m_list = MList.find(params[:id])
    end

    def m_list_params
      params[:m_list].permit!
    end

  end
end