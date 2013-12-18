# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MHelpsController < ApplicationController
    before_action :set_m_help, only: [:show, :edit, :update, :destroy]
    respond_to :html, :xml, :json
    def index
      @m_helps = MHelp.where({
                                 :name => params[:name]
                             }.delete_if {|k, v| v.blank? })
      data = paginate(@m_helps)
      respond_with(data.to_json())
    end

    def show
      #@m_help = MHelp.find(params[:id])
      respond_with(@m_help)
    end

    def edit
      #@m_help = MHelp.find(params[:id])
      respond_with(@m_help)
    end

    def new
      @m_help = MHelp.new
      respond_with(@m_help)
    end

    def create
      @m_help = MHelp.new(params[:m_help].permit!)
      respond_with(@m_help) do |format|
        if @m_help.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      #@m_help = MHelp.find(params[:id])

      respond_with(@m_help) do |format|
        if @m_help.update_attributes(params[:m_help].permit!)
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      #@m_help = MHelp.find(params[:id])
      @m_help.destroy
      respond_with(@m_help)
    end

    private
    def set_m_help
      @m_help = MHelp.find(params[:id])
    end

    def m_help_params
      params[:m_help].permit!
    end

  end
end
