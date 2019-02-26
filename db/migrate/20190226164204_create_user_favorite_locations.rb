class CreateUserFavoriteLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favorite_locations do |t|
      t.references :user, foreign_key: true
      t.references :favorite_location, foreign_key: true
    end
  end
end
