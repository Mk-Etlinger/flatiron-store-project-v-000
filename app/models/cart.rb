class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_number)
    if line_item = self.line_items.find_by(item_id: item_number)
      line_item.update(quantity: line_item.quantity + 1)
      line_item 
    else      
      self.line_items.build(item_id: item_number)
    end
  end

  def total
    self.line_items.collect { |line_item| line_item.item.price * line_item.quantity }.sum
  end  
  
end
