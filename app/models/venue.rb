class Venue < ActiveRecord::Base
  belongs_to :region
  has_many :events
  validates_uniqueness_of :name
  validates_presence_of :name, :region_id, :full_address
end
