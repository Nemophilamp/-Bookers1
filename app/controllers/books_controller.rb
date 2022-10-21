class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = book.new(list_params)
    # データを受け取り新規登録するためのインスタンス作成
  end

  def index
  end

  def show
  end

  def edit
  end
end
