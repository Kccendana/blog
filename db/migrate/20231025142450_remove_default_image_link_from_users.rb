class RemoveDefaultImageLinkFromUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :photo, nil
  end
end
