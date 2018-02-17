class SearchesController < ApplicationController
	def index
		if !params[:search].nil? && !params[:search].empty?
		@users = User.where( 'name LIKE ?' , "%#{params[:search]}%" )
	end
		

	end		
		
					
end
