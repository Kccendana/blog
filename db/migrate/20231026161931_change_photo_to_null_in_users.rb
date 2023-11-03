class ChangePhotoToNullInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :photo, true
  end
end
