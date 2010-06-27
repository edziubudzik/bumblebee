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

	def progress
		@progress ||= block_stages.sum(:progress)
	end

	def percental_progress
		if cost and progress
			(progress.to_f/cost.to_f*100).round
		else
			0
		end
	end

	def project_cost_participation
		if project.cost > 0
      (cost.to_f/project.cost.to_f*100).round
    else
      0
    end
	end
	
end
