# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MPersonRolesController < ApplicationController
    before_action :set_m_person_role, only: [:show, :edit, :update, :destroy]
    respond_to :html, :xml, :json

    def index
      @m_person_roles = MPersonRole.where({
                                              :m_role_id => params[:m_role_id]
                                          }.delete_if {|k, v| v.blank? })
      data = paginate(@m_person_roles)
      respond_with(data.to_json({:include => [:m_person, :m_role]}))
    end

    def show
      #@m_person_role = MPersonRole.find(params[:id])
      respond_with(@m_person_role)
    end

    def edit
      #@m_person_role = MPersonRole.find(params[:id])
      respond_with(@m_person_role.to_json({:include => [:m_person, :m_role]}))
    end

    def new
      @m_person_role = MPersonRole.new
      respond_with(@m_person_role)
    end

    def create
      @m_person_role = MPersonRole.new(m_person_role_params)
      respond_with(@m_person_role) do |format|
        if @m_person_role.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      #@m_person_role = MPersonRole.find(params[:id])
      respond_with(@m_person_role) do |format|
        if @m_person_role.update_attributes(m_person_role_params)
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      #@m_person_role = MPersonRole.find(params[:id])
      @m_person_role.destroy
      respond_with(@m_person_role)
    end

    private
    def set_m_person_role
      @m_person_role = MPersonRole.find(params[:id])
    end

    def m_person_role_params
      params[:m_person_role].permit!
    end

  end
end
