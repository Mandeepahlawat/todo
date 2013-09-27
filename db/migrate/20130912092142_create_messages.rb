class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :subject
      t.text :body, :limit => 4294967295
      t.references :user

      t.timestamps
    end
  end
end
