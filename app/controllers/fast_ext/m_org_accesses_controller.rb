# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MOrgAccessesController < ApplicationController
    before_action :set_m_org_access, only: [:show, :edit, :update, :destroy]
    respond_to :html, :xml, :json

    def index
      @m_org_accesses = MOrgAccess.where({
                                             :m_role_id => params[:m_role_id]
                                         }.delete_if {|k, v| v.blank? })
      data = paginate(@m_org_accesses)
      respond_with(data.to_json({:include => [:m_org, :m_role]}))
    end

    def show
      #@m_org_access = MOrgAccess.find(params[:id])
      respond_with(@m_org_access)
    end

    def edit
      #@m_org_access = MOrgAccess.find(params[:id])
      respond_with(@m_org_access.to_json({:include => [:m_org, :m_role]}))
    end

    def new
      @m_org_access = MOrgAccess.new
      respond_with(@m_org_access)
    end

    def create
      @m_org_access = MOrgAccess.new(m_org_access_params)
      respond_with(@m_org_access) do |format|
        if @m_org_access.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      #@m_org_access = MOrgAccess.find(params[:id])
      respond_with(@m_org_access) do |format|
        if @m_org_access.update_attributes(m_org_access_params)
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      #@m_org_access = MOrgAccess.find(params[:id])
      @m_org_access.destroy
      respond_with(@m_org_access)
    end

    private
    def set_m_org_access
      @m_org = MOrgAccess.find(params[:id])
    end

    def m_org_access_params
      params[:m_org_access].permit!
    end

  end
end
