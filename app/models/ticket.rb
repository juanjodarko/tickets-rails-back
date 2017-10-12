class Ticket < ApplicationRecord
	has_many :messages
	belongs_to :user, :foreign_key => 'customer_id'
	belongs_to :user, :foreign_key => 'agent_id'
end
