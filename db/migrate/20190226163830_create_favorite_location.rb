class CreateFavoriteLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_locations do |t|
      t.string :location
    end
  end
end
