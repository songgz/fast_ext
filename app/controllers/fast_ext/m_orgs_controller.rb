# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MOrgsController < ApplicationController
    before_action :set_m_org, only: [:show, :edit, :update, :destroy]
    respond_to :html, :xml, :json

    def index
      #@m_orgs = MOrg.scoped
      @m_orgs = params[:node] == '' ? MOrg.roots : MOrg.where({
                                                                    :parent_id => params[:node]
                                                                }.delete_if { |k, v| v.blank? })

      respond_with(@m_orgs.to_json(:include => [:parent], :methods => [:leaf, :expanded]))
    end

    def show
      #@m_org = MOrg.find(params[:id])
      respond_with(@m_org)
    end

    def edit
      #@m_org = MOrg.find(params[:id])
      respond_with(@m_org.to_json(:include => [:parent]))
    end

    def new
      @m_org = MOrg.new
      respond_with(@m_org)
    end

    def create
      @m_org = MOrg.new(m_org_params)
      respond_with(@m_org) do |format|
        if @m_org.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      #@m_org = MOrg.find(params[:id])

      respond_with(@m_org) do |format|
        if @m_org.update_attributes(m_org_params)
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      #@m_org = MOrg.find(params[:id])
      @m_org.destroy
      respond_with(@m_org)
    end

    private
    def set_m_org
      @m_org = MOrg.find(params[:id])
    end

    def m_org_params
      params[:m_org].permit!
    end

  end
end