class BooksController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: Book.all
  end

  def show
    render json: Book.find(params[:id])
  end

  def create
    render json: Book.create!(params.permit(:title))
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    render json: { message: 'Book deleted' }
  end
end
