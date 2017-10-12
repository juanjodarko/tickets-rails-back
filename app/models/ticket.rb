class Ticket < ApplicationRecord
	has_many :messages
	belongs_to :user, :foreign_key => 'customer_id'
	has_one :user, :foreign_key => 'agent_id'
end
