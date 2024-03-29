class BooksController < ApplicationController
before_action :ensure_correct_user, only:[:edit,:destroy]

  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user=current_user
      render 'index'
    end
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @user=current_user

  end

  def index
    @book = Book.new
    @books = Book.all
    @books.order("id")
    @user=current_user

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:notice]="Book was successfully destroyed."
    redirect_to books_path
    end
  end

    private
  # ストロングパラメータ

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
      unless @book.user == current_user
      redirect_to books_path
      end
  end

end