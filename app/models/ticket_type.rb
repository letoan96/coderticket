class TicketType < ActiveRecord::Base
  belongs_to :event 
  validates_presence_of :name, :event_id, :max_quantity

  def to_i
  	self.max_quantity.to_i
  end

end
