class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    # バリデーション/必須入力設定/投稿が成功した時に
    if @book.save
      flash[:notice] = "Book was successfully created"
    # 投稿成功　 へリダイレクト
      redirect_to book_path(@book.id)
    # 投稿が失敗した時newを表示
    else
      @books = Book.all
      render :index
    end
  end

# ID若い順＝新しいものから　降順 created_at: 'asc'
  def index
    @books = Book.all.order(created_at: 'desc')
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

    # データ（レコード）を1件取得
    # データ（レコード）を削除
    # 投稿一覧画面へリダイレクト
    # 削除成功メッセージ,　緑
  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to "/books"
    end
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end