class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])#stores the Article instance into an @instance_variable. With this added, also, the edit view will have access to this particular instance variable. 
  end

  def update
    #raise params.inspect #raise method pauses the application and prints out the params on an error page. puts params.inspect also shows the params data, but it would need to be searched for in the log.
    @article = Article.find(params[:id])#the Article object in question is found according to their unique :id and then placed inside an @instance_variable
    @article.update(title: params[:article][:title], description: params[:article][:description])#that same @instance_variable is updated (.update is an ActiveRecord method, as oppsed to the one we're fleshing out now; confusing) with the user input data stored inside params
    redirect_to article_path(@article)#finally, after being updated, user is redirected to that particular instances show page.
  end

end
