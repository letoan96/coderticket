class Event < ActiveRecord::Base
  belongs_to :venue, dependent: :destroy
  belongs_to :category
  has_many :ticket_types, dependent: :destroy

  validates_presence_of :extended_html_description, :venue_id, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
  	Event.where("starts_at > ? AND published_at is not ? ", Time.now, nil)
  end

  def self.published
    Event.where.not(:published_at => nil )
  end

  def self.search (search)
  	Event.where("name ILIKE ? AND published_at is not ? ", "%#{search}%",nil)
  end

  def tickets
  	TicketType.where(event_id: id)
  end
end
