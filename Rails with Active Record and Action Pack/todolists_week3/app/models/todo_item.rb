class TodoItem < ActiveRecord::Base
	after_initialize :init
	def init
		self.completed ||= false
	end

	def self.get_completed_count
		TodoItem.where(completed: true).count
	end
end
