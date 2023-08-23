class BooksController < ApplicationController
  def new
  end

  def index
    @list = Book.new
    @lists = Book.all
  end
  def create
    @list = Book.new(list_params)
    if @list.save
      flash[:notice] = "The book has been created successfully"
      redirect_to book_path(@list.id)
    else
      flash.now[:notice] = "error: somthing went wrong"
      @lists = Book.all
      render :index
    end
  end
  def show
    @list = Book.find(params[:id])
  end

  def update
    @list = Book.find(params[:id])
    @list.update(list_params)
    if @list.save
      flash[:notice] = "The book has been updated successfully"
      redirect_to book_path(@list.id)
    else
      flash.now[:notice] = "error: somthing went wrong"
      @lists = Book.all
      render :edit
    end
  end

  def edit
    @list = Book.find(params[:id])
  end

  def destroy
    list = Book.find(params[:id])
    list.destroy
    redirect_to '/books'
    flash[:notice] = "The book has been destroyed successfully"
  end
  private
  # ストロングパラメータ
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
