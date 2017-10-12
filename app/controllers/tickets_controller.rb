class TicketsController < ApplicationController
	before_action :authenticate_user! 
  	after_action :verify_authorized

  	def index
  		@tickets = Ticket.all
  		authorize @tickets
  		render :json => @tickets.to_json(:include => [{ :messages => { :include => :user } }, :customer, :agent])
  	end

  	def show
  		@ticket = Ticket.find(params[:id])
  		authorize @ticket
  		render :json => @ticket.to_json(:include => [{ :messages => { :include => :user }}, :customer, :agent])
  	end

  	def create
  		offset = rand(User.where(:role => :agent).count)
  		puts User.where(:role => :agent).offset(offset)
  		@agent = User.where(:role => :agent).offset(offset)
  		puts @agent.to_json()
  		@ticket = Ticket.new(new_ticket_params)
  		@ticket.update(:agent_id => @agent.first.id)
  		authorize @ticket
  		if @ticket.save
  			render :json => @ticket, status: 200
  		else
  			render :json => @ticket.errors, status: :unprocessable_entity
  		end
  	end

  	private
  		def new_ticket_params
  			params.require(:ticket).permit(:title, :description, :customer_id)
  		end
end