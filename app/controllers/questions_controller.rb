class QuestionsController < ApplicationController
	def index
		@sections = Section.all
		@questions = Question.all
		@submissio = Submissio.find(params[:submissio_id])
	end

	def show
		@question = Question.find(params[:id])
	end
end
