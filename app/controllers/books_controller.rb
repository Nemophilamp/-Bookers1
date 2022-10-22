class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = book.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    # バリデーション/必須入力設定/投稿が成功した時に
    if @book.save
      flash[:notice] = "List was successfully created"
    # 詳細画面へリダイレクト
      redirect_to book_path(@boo
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end
end
