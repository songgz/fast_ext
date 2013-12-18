# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MWindowAccessesController < ApplicationController
    before_action :set_m_window_access, only: [:show, :edit, :update, :destroy]
    respond_to :html, :xml, :json

    def index
      @m_window_accesses = MWindowAccess.where({
                                                   :m_role_id => params[:m_role_id]
                                               }.delete_if {|k, v| v.blank? })
      data = paginate(@m_window_accesses)
      respond_with(data.to_json({:include => :m_role}))
    end

    def show
      #@m_window_access = MWindowAccess.find(params[:id])
      respond_with(@m_window_access)
    end

    def edit
      #@m_window_access = MWindowAccess.find(params[:id])
      respond_with(@m_window_access.to_json({:include => :m_role}))
    end

    def new
      @m_window_access = MWindowAccess.new
      respond_with(@m_window_access)
    end

    def create
      @m_window_access = MWindowAccess.new(m_window_access_params)
      respond_with(@m_window_access) do |format|
        if @m_window_access.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      #@m_window_access = MWindowAccess.find(params[:id])
      respond_with(@m_window_access) do |format|
        if @m_window_access.update_attributes(m_window_access_params)
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      #@m_window_access = MWindowAccess.find(params[:id])
      @m_window_access.destroy
      respond_with(@m_window_access)
    end

    private
    def set_m_window_access
      @m_org = MWindowAccess.find(params[:id])
    end

    def m_window_access_params
      params[:m_window_access].permit!
    end

  end
end
