class Addcolumntoevent < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :creater_id, :integer
  	add_column :events, :published_at, :datetime
  end
end
