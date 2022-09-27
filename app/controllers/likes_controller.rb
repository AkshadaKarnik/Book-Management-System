class LikesController < ApplicationController
	def create
    @book = Book.find(params[:book_id])
    @like = @book.likes.create(like_params)
    redirect_to book_path(@book)
  end

  def like_on_comment
  	@comment = Comment.find(params[:comment_id])
  	@like = @comment.likes.create(like_params)
  	redirect_to book_comment_path(@comment)
  end

  private
    def like_params
      params.require(:like)#.permit(:book_id, :comment_id)
    end
end
