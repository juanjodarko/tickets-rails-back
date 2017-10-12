class TicketPolicy
	attr_reader :current_user, :model

  	def initialize(current_user, model)
    	@current_user = current_user
    	@model = model
  	end

	def index?
		true
	end
	
	def show?
	    true
	end

	def create?
	    true
	end

	def new?
	    create?
	end

	def update?
	    true
	end

	def edit?
	    update?
	end

	def destroy?
	    return false if @current_user == @user
	    @current_user.admin?
	end
end