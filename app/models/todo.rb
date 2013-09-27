class Todo < ActiveRecord::Base
	belongs_to :task
  belongs_to :category
  validates :title, presence: true
  def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |product|
	      csv << product.attributes.values_at(*column_names)
	    end
	  end
	end

	def self.search(search, task, id)
		#debugger
	  if search
	  	#debugger
	    Todo.joins(:task).where('todos.title LIKE ? AND tasks.user_id = ?', "%#{search}%","#{id}")
	  else
	  	where(:task_id => task.id)
	  end
	end
end
