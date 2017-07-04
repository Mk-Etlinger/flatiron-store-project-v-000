class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :current_cart

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts

  def current_cart=(cart)
    self.update(current_cart_id: cart.try(:id))
  end
  
  def current_cart
    self.carts.find_by(id: self.current_cart_id)
  end
  
end
