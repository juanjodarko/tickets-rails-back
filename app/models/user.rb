class User < ActiveRecord::Base
  # Include default devise modules.
  enum role: [:customer, :agent, :admin]
  after_initialize :set_default_role, :if => :new_record?


  def set_default_role
  	self.role ||= :customer
  end
  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :messages
  has_many :tickets
end
