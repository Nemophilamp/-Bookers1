class BooksController < ApplicationController
  def new
    @book = Book.new

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    # バリデーション/必須入力設定/投稿が成功した時に
    if @book.save
      flash[:notice] = "List was successfully created"
    # 投稿成功　 へリダイレクト
      redirect_to book_path(@book.id)
    # 投稿が失敗した時newを表示
    else
      render :new
    end
  end


  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
end