class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to books_path
    else
      render books_path
    end
  end

  def show
    @book = Book.find(params[:id])  
  end

  def index
    @book = Book.new
    @books = Book.all
    @books.order("id")
  end
  
  def edit
    @book = Book.find(params[:id]) 
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to books_path(@book.id) 
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
end
