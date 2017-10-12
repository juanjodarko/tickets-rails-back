class Message < ApplicationRecord
  belongs_to :ticket, dependent: :destroy
  belongs_to :user
end
