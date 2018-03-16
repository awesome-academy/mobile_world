class Order < ApplicationRecord
  has_many :order_details
  accepts_nested_attributes_for :order_details
  belongs_to :user
  before_save :update_subtotal
  enum status: [:inprogress, :shipping, :done, :cancelled]
  validates :phone_number, numericality: {only_integer: true},
    length: {maximum: Settings.phone_number.max_length, 
    minimum: Settings.phone_number.min_length}
  validates :address, presence: true, 
    length: {minimum: Settings.address.min_length}
  validates :name, presence: true
  
  def subtotal
    order_details.collect {|od| od.valid? ? (od.quantity * od.price) : Settings.order.total_money_nil}.sum
  end
  
  private

  def update_subtotal
    self[:total_money] = subtotal
  end
end
