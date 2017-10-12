class MessagesController < ApplicationController
	def create
		@message = Message.new(message_params)
		authorize @message
		if @message.save
  			render :json => @message, status: 200
  		else
  			render :json => @message.errors, status: :unprocessable_entity
  		end
	end

	private
		def message_params
			params.require(:message).permit(:content, :ticket_id, :user_id)
		end
end
