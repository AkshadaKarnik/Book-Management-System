class BooksController < ApplicationController

	before_action :check_author, only: [:new, :create, :edit, :update, :destroy]
	before_action :my_book, only: [:show, :edit, :update, :destroy]

	def index
		@books = Book.all
	end

	def show
	end

	def new
		@book = Book.new
	end

	def create
		# byebug
		@book = current_user.books.new(book_params)
  
    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
	end

	def edit
	end

	def update
		if @book
			@book.update(book_params)
			redirect_to @book
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@book.destroy
		redirect_to root_path, status: :see_other
	end

	private

	def book_params
		params.require(:book).permit(:user_id, :title, :cover_image, :description)
	end

	def my_book
		@book = Book.find(params[:id])
	end

	def check_author
		render json: {errors: "you are not authorized to perform this action."} and return unless current_user.role == 'author'
	end
end
