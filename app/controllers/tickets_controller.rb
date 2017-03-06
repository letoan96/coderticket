class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket = TicketType.new(event_id: params[:event_id], price: params[:price], name: params[:name], max_quantity: params[:max_quantity])
    @created_ticket = TicketType.where(:event_id => params[:event_id])
  end

  def select_ticket_type
  	@event = Event.find(params[:event_id])

  	if params[:quantity].present?
  		@a = 0
  		params[:quantity].each do |key,value|
  			@a += value.to_i
  		end
  		if @a == 0
  			flash.now[:error] = "Please select quantity!"
  		else
  			redirect_to root_path
  			flash[:succes] = "Your ticket has been sent to your email"
  		end
   end
 end

 def create
  @created_ticket = TicketType.where(:event_id => params[:event_id])
  @ticket = TicketType.new ticket_params
  @ticket[:event_id] = params[:event_id]
  if @ticket.save
    flash[:success] = "Ticket has been created"
    redirect_to my_event_event_path(current_user)
  else
    render 'new'
  end
end 

private
def ticket_params
  params.require(:ticket_type).permit(:name, :price, :max_quantity, :event_id)  
end

end
