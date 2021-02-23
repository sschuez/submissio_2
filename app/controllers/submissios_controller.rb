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
		  params[:submissio][:questions]
		  redirect_to submissio_path(@submissio)
		  flash[:notice] = "Submissio for #{@submissio.authority} has been created"
		else
		  render :new
		end
	end

	def edit
  end

	def update
		params[:answers].each do |k, v|
		  answer = Answer.find(k)
		  answer.content = v
		  answer.submissio = @submissio
		  respond_to do | format |
			  if answer.save
			  	format.html
			  	format.json { render :show, status: :ok, location: @submissio }
			  end
			end
			end
		redirect_to submissio_path(@submissio)
		flash[:notice] = "Submissio for #{@submissio.authority} has been updated"
		# if @submissio.update(submissio_params)
		# 	redirect_to submissio_path(@submissio)
		# 	flash[:notice] = "Submissio for #{@submissio.authority} has been updated"
		# else
		# 	render :edit
		# end
	end

	private

	def set_submissio
	  @submissio = Submissio.find(params[:id])
	end

  def submissio_params
    params.require(:submissio).permit(:authority)
  end
end
