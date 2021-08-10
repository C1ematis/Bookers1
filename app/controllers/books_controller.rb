class BooksController < ApplicationController

$f = {"crt" => 0, "up" => 0, "del" => 0 }

  def top
  end


  def index
    #@books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      $f["crt"] = true
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      $f["up"] = true
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    $f["del"] = true
    redirect_to books_path
  end


private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
