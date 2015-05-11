class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.create(params[:comment].permit(:content))
		@comment.user = current_user
		@comment.save
		redirect_to idea_path(@idea)
	end

	def destroy
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.find(params[:id])
		@comment.destroy

		redirect_to idea_path(@idea)
	end
end
