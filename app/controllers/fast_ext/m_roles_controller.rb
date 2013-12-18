# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MRolesController < ApplicationController
    before_action :set_m_role, only: [:show, :edit, :update, :destroy]
    respond_to :html, :xml, :json

    def index        
      @m_roles = MRole.all
      data = paginate(@m_roles)
      respond_with(data.to_json({:include => [:m_people, :m_menu],:methods => :m_person_ids}))
    end

    def show
      #@m_role = MRole.find(params[:id])
      respond_with(@m_role)
    end

    def edit
      #@m_role = MRole.find(params[:id])
      respond_with(@m_role.to_json({:include => :m_people,:methods => :m_person_ids}))
    end

    def new
      @m_role = MRole.new
      respond_with(@m_role)
    end

    def create
      @m_role = MRole.new(m_role_params)
      respond_with(@m_role) do |format|
        if @m_role.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      #@m_role = MRole.find(params[:id])

      respond_with(@m_role) do |format|
        if @m_role.update_attributes(m_role_params)
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_role = MRole.find(params[:id])
      @m_role.destroy
      respond_with(@m_role)
    end

    private
    def set_m_role
      @m_role = MRole.find(params[:id])
    end

    def m_role_params
      params[:m_role].permit!
    end


  end
end