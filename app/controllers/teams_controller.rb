class TeamsController < ApplicationController
	def new
		@team = Team.new
	end
	def create
		@team = Team.new(params[:team])
		if @team.save
			redirect_to team_path(@team)
		else
			flash.now[:team_error] = "Please include required field. (Team Name)"
			render :new
		end
	end
	def edit
		@team = Team.find(params[:id])
	end
	def update
		@team = Team.find(params[:id])
		if @team.update_attributes(params[:team])
			redirect_to team_path(@team)
		else
			flash.now[:team_error] = "Please include required field. (Team Name)"
			render :edit
		end
	end
	def index
		@teams = Team.includes(:supervisor).all
	end
	def show
		@team = Team.includes(:supervisor, :employees).find(params[:id])
	end
	def destroy
		@team = Team.find(params[:id])
		@team.destroy
		redirect_to teams_path
	end
end
