class Ticket < ApplicationRecord
	enum status: [:open, :answered, :closed]
	after_initialize :set_default_status, :if => :new_record?
	has_many :messages
	belongs_to :customer, :class_name => 'User', :foreign_key => 'customer_id'
	belongs_to :agent, :class_name => 'User', :foreign_key => 'agent_id'

	def set_default_status
		self.status ||= :open
	end
	
end
