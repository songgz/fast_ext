# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MMenusController < ApplicationController
    before_action :set_m_menu, only: [:show, :edit, :update, :destroy]
    respond_to :html, :xml, :json
    def index
      @m_menus = MMenu.all
      data = paginate(@m_menus)
      respond_with(data.to_json(:include => [:m_menu_items,:createdbyorg, :createdby, :updatedby]))
    end

    def show
      #@m_menu = MMenu.find(params[:id])
      respond_with(@m_menu)
    end

    def edit
      #@m_menu = MMenu.find(params[:id])
      respond_with(@m_menu.to_json(:include => [:createdbyorg, :createdby, :updatedby]))
    end

    def new
      @m_menu = MMenu.new
      respond_with(@m_menu)
    end

    def create
      @m_menu = MMenu.new(m_menu_params)
      respond_with(@m_menu) do |format|
        if @m_menu.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      #@m_menu = MMenu.find(params[:id])

      respond_with(@m_menu) do |format|
        if @m_menu.update_attributes(m_menu_params)
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      #@m_menu = MMenu.find(params[:id])
      @m_menu.destroy
      respond_with(@m_menu)
    end

    private
    def set_m_menu
      @m_menu = MMenu.find(params[:id])
    end

    def m_menu_params
      params[:m_menu].permit!
    end


  end
end