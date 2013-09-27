class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :messages do |t|
      t.index :user_id
      t.index :message_id
    end
  end
end
