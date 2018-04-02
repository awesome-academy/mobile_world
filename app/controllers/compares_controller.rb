class ComparesController < ApplicationController
  before_action :set_compares_session
  
  def index
    @q = Mobile.ransack(params[:q])
    @mobiles = Mobile.find(session[:compares])
  end
  
  def searchs
    @mobiles = Mobile.ransack(name_cont: params[:q]).result(distinct: true).limit(
      Settings.litmited_search.item)
    respond_to do |format|
      format.html {}
      format.json {
        @mobiles
      }
    end
  end
  
  def create
    if params[:mobile_id]
      session[:compares] = []
    end
    if session[:compares].size >= Settings.litmited_compare.item
      flash[:danger] = t "flash.add_compare_error"
    else
      compare = Compare.new params, session[:compares]
      compare.add_to_array
    end
    redirect_to compares_path
  end
  
  def destroy
    compare = Compare.new params, session[:compares]
    session[:compares] = compare.delete_compare params[:id]
    render json: {
      mobile_id: params[:id]
    }
  end
  
  private
  
  def set_compares_session
    return if session[:compares].present?
    session[:compares] = []
  end
end
