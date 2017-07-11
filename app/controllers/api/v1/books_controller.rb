class Api::V1::BooksController < Api::V1::BaseController

  before_action :set_book, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @books = Book.all
    render json: @books.to_json
  end

  def show
    render json: @book.to_json
  end

  def create
    @book = Book.new(book_params)
    message = {}

    respond_to do |format|
      if @book.save
        message = "Book is created."
        format.json { render json: message.to_json, status: :ok }
      else
        puts "=====@book.errors=====",@book.errors.inspect
        format.json { render json: @book.errors.to_json, status: :unprocessable_entity }
      end
    end
  end

  def update
    message = {}
    respond_to do |format|
      if @book.update(book_params)
        message = "Book is updated."
        format.json { render json: message.to_json, status: :ok }
      else
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.json { render json: 'Book was successfully destroyed.'.to_json }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :details)
  end

end