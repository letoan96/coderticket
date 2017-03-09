class EventsController < ApplicationController
  def index
    @events = Event.upcoming
    if (params[:search])
    	@events = Event.search(params[:search])
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
  	@event = Event.new(name: params[:name], :starts_at => params[:starts_at], ends_at: params[:ends_at], extended_html_description: params[:extended_html_description] , hero_image_url: params[:hero_image_url], category_id: params[:category_id])
  	@venue = Venue.new(name: params[:venue_name], full_address: params[:venue_address], region_id: params[:region_id])
  end

  def create
  	@event = Event.new event_params
  	@venue = Venue.new venue_params
    @event[:creater_id] = current_user.id
    if @venue.save 
      @event[:venue_id] = @venue.id
      if @event.save
        flash[:success] = "Your event has been created"
        redirect_to root_path
      else
        render 'new'
      end
    else
        render 'new'
    end
  end

  def my_event
    @my_event = Event.where(:creater_id => current_user.id)
  end

  def publish
    @publish = Event.find(params[:event_id])
    @publish.published_at = Time.now.to_datetime
    @ticket_count = TicketType.where(:event_id => params[:event_id]).count
    if @ticket_count > 0
      @publish.save
      flash[:success] = " Your event has been published "
      redirect_to my_event_event_path(current_user.id)
    else
      flash[:error] = " An event must has at least one ticket type "
      redirect_to my_event_event_path(current_user.id)
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    @venue = Venue.find(@event.id)
  end

  def update
    @event = Event.find(params[:event_id])
    @venue = Venue.find(params[:event_id])
    if @venue.update(venue_params) &&  @event.update(event_params)
    flash[:success] = " Event has been updated "
    redirect_to my_event_event_path(current_user)
    else
      render 'new'
    end
  end

  private
  def event_params
  	params.require(:event).permit(:name, :starts_at, :ends_at, :extended_html_description, :hero_image_url, :venue_id, :category_id, :creater_id )	
  end

  def venue_params
  	params.require(:venue).permit(:name, :full_address, :region_id)
  end

end
