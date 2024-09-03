# frozen_string_literal: true

module BooksManagementConcern
  # GET /books/1
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      respond_to do |format|
        format.html { redirect_to(@book, notice: "Book was successfully created.") }
        format.json { render(json: @book, status: :created) }
      end
    else
      respond_to do |format|
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @book.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /books/1
  def update
    if book_params.present? && @book.update(book_params)
      respond_to do |format|
        format.html { redirect_to(@book, notice: "Book was successfully updated.", status: :see_other) }
        format.json { render(json: @book, status: :no_content) }
      end
    else
      respond_to do |format|
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @book.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url, notice: "Book was successfully destroyed.", status: :see_other) }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find_by!(id: params[:id])
  end
end
