class SubmissiosController < ApplicationController
	before_action :set_submissio, only: %i[ show edit update destroy ]

	def index
		@submissios = Submissio.all
	end

	def new
		@submissio = Submissio.new
	end

	def show
	end

	def create
		@submissio = Submissio.new(submissio_params)
		@submissio.user = current_user
		if @submissio.user == nil
		  redirect_to root_path
		  flash[:notice] = "Please log in to create a new submissio"
		elsif
		  @submissio.save
		  # params[:submissio][:questions]
		  # params[:submissio][:questions].each {|section_id| Section.create(section_id: section_id, submissio_id: @submissio.id) }
		  redirect_to submissio_path(@submissio)
		  flash[:notice] = "Submissio for #{@submissio.authority} has been created"
		else
		  render :new
		end
	end

	def update
		# params[:answers].each do |k, v|
		  # answer = Answer.find(k)
		  # answer.content = v
		  # answer.submissio = @submissio
		  # answer.save
		# end
		if @submissio.update(submissio_params)
			redirect_to submissio_path(@submissio)
			flash[:notice] = "Submissio for #{@submissio.authority} has been updated"
		else
			render :edit
		end
	end

	private

	def set_submissio
	  @submissio = Submissio.find(params[:id])
	  @sections = Section.all
	end

  def submissio_params
    params.require(:submissio).permit(:authority)
  end
end