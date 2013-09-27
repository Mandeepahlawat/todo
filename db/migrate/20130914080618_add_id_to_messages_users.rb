class AddIdToMessagesUsers < ActiveRecord::Migration
  def change
  	add_column :messages_users, :id, :primary_key
  end
end
