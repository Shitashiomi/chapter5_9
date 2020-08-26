class BooksController < ApplicationController
 before_action :authenticate_user!, except: [:top]

  def top
    book = Book.new
  end

  def new
    @book = Book.new
  end


  def index
    @book = Book.new
  	@books = Book.all.order(created_at: :desc)
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
        redirect_to book_path(@book.id), notice: "You have creatad book successfully.."
      else
        @books = Book.all
        render :index
      end
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have creatad book successfully.."
    else
      render 'edit'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body,)
  end
end
