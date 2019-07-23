class AddContentIdToFavorite < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :sentence_id, :integer
  end
end
