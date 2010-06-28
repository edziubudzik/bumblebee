class Stage < ActiveRecord::Base
  belongs_to :project
  belongs_to :stage_type
  
  has_and_belongs_to_many :blocks
  has_many :block_stages
  
  has_many :events, :as => :eventable

	def start_date
		if previous
			previous.end_date
		else
			project.start_date
		end
	end

	def end_date
		start_date + (cost/8/project.human_resources).days
	end

	def previous
		return @previous if @previous

		for stage in project.stages
			if (stage.stage_type.position < stage_type.position) &&
					((@previous && stage.stage_type.position > @previous.stage_type.position) or !@previous)
						@previous = stage
			end
		end

		@previous
	end

	def cost
		@cost ||= block_stages.sum(:cost)
	end

	def time_spent
		@time_spent ||= block_stages.sum(:time_spent)
	end

	def progress
		sum1 = 0
		sum2 = 0
		for bs in  block_stages
			sum1 += bs.progress.to_f/100*bs.cost
			sum2 += bs.cost
		end
		@progress ||= sum1.to_f/sum2*100
	end

	def earned_value
		sum = 0
		for bs in  block_stages
			sum += bs.progress.to_f/100*bs.cost
		end
		@earned_value ||= sum.to_f
	end

	def percental_progress
		progress ? progress : 0
	end

	def project_cost_participation
		if project.cost > 0
      (cost.to_f/project.cost.to_f*100).round
    else
      0
    end
	end
	
end
