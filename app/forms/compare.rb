class Compare
  def initialize params, mobile_array =[]
    @mobile_id = params[:mobile_id].to_s
    @recommend_id = params[:recommend_id].to_s
    @search_mobile_id = params[:search_mobile_id].to_s
    @mobile_array = mobile_array
  end
  
  def add_to_array
    data @mobile_id
    data @recommend_id
    data @search_mobile_id
  end
  
  
  def delete_compare mobile_id
    @mobile_array.delete(mobile_id)
    @mobile_array
  end
  
  private
  
  def data params
    if @mobile_array.size < Settings.litmited_compare.item
      return if !params.present?
      return if @mobile_array.include?(params)
      @mobile_array << params
    end
    @mobile_array
  end
end
