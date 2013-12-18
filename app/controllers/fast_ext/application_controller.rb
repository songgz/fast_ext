# encoding: utf-8
module FastExt
  class ApplicationController < ActionController::Base
    before_filter :current_user


    # 分页方法
    def paginate(record_relation)
      limit = params[:limit].to_i
      start = params[:start].to_i
      @records = record_relation
      if limit != 0
        @records = record_relation.limit(limit).offset(start)
      end
      data ={
          :totalCount => record_relation.length,
          :rows => @records
      }
    end

    helper_method :current_user

    def current_user
      # Note: we want to use "find_by_id" because it's OK to return a nil.
      # If we were to use User.find, it would throw an exception if the user can't be found.
      @current_user ||= session[:type].find_by_id(session[:user_id]) if session[:type] && session[:user_id]
    end
  end
end
