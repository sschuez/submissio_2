class AnswersController < ApplicationController

  def index
    @submissio = Submissio.find(params[:submissio_id])
  end

  def show
    @submissio = submissio.find(params[:submissio_id])
  end

  def edit
  end

end
