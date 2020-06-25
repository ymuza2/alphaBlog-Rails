class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end


  def  destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted."
    redirect_to article_path
  end

  # POST /articles
  # POST /articles.json

  #   def create
  #  @article = Article.new(article_params)

  #  respond_to do |format|
  #   if @article.save
  #     format.html {redirect_to @article, notice: 'Article was successfully created.'}
  #     format.json {render :show, status: :created, location: @article}
  #   else
  #    format.html {render :new}
  #   format.json {render json: @article.errors, status: :unprocessable_entity}
  #   end#
  #    end
  #end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json


  # private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
