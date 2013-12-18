# encoding: utf-8
require_dependency "fast_ext/application_controller"

module FastExt
  class MViewsController < ApplicationController
    respond_to :html, :xml, :json
    def index

      @window = FastExt::Window.find(params[:name])
      respond_with(@window.to_json())
    end

    def show
      @window = FastExt::Window.find(params[:id])
      respond_with(@window.to_json())
    end

  end
end
