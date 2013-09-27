class FacebookTodo
	attr_reader :graph, :status_message 
	def initialize(token)
		@graph = Koala::Facebook::API.new(token)
	end

	def get_status
		begin
			@statuses = @graph.get_connections("me","statuses")
			@status_message = @statuses.first["message"]
			return values(true,@status_message)
		rescue Faraday::Error::ConnectionFailed
			values(false,"Please check your internet connection")
		rescue Koala::Facebook::AuthenticationError
			values(false,"Token is not correct")
		rescue Exception => e
			values(false,"#{e.message}")
		end
	end

	def values(stat,msg)
		value_hash = {status: stat , message: msg} 
	end
end