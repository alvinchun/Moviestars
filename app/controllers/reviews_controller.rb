class ReviewsController < ApplicationController
	before_action :find_play
	before_action :find_review, only: [:edit, :update, :destroy]

	def new
		#View files
		@review = Review.new
	end

	def create
		# Responsible for changes in database
		@review = Review.new(review_params)
		@review.play_id = @play.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to play_path(@play)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			#when it's successful (redirect = refresh and to the show page)
			redirect_to play_path(@play)
		else
			# If it fails to update the review, we don't want the page to refresh and lose data. So we just render the 'edit' page again. ex) when there is internet disconnection.
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to play_path(@play)
	end

	private

	def review_params
		params.require(:review).permit(:rating, :comment)
	end

	def find_play
		@play = Play.find(params[:play_id])
	end

	def find_review
		@review = Review.find(params[:id])
	end
end
