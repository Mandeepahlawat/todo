class Message < ActiveRecord::Base
	belongs_to :user
	has_many :messages_users
	has_many :receivers, through: :messages_users, source:  :user #,class_name: "User", foreign_key: "message_id"
	accepts_nested_attributes_for :messages_users
end
