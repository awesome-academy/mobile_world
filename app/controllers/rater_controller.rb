class RaterController < ApplicationController

  def create
    if user_signed_in?
      @obj = params[:klass].classify.constantize.find(params[:id])
      @obj.rate params[:score].to_f, current_user, params[:dimension]
    end
    respond_to do |format|
      format.js
    end
  end
end
