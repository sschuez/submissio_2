class SectionsController < ApplicationController
	before_action :set_section, only: [:show, :edit, :update, :destroy]

	def index
		@sections = Section.all
	end


	private

	def set_section
		@section = Section.find(params[:id])		
	end

	def section_params
		params.require(:section).permit(:name)
	end
end
