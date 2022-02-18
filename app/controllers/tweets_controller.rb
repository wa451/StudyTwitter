class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
    def index
      
      if params[:search] == ''
        @tweets= Tweet.all.order(id: "DESC").page(params[:page]).per(10)
      elsif params[:search] == 'newtweet'
        @tweets= Tweet.all.order(id: "DESC").page(params[:page]).per(10)
      elsif params[:search] == 'oldtweet'
        @tweets= Tweet.all.page(params[:page]).per(10)
      elsif params[:search] == 'liketweet'
        @tweets= @tweets = Tweet.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}.page(params[:page]).per(10)
      else
        search = params[:search]
        @tweets = Tweet.joins(:user).where("subject LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%").page(params[:page]).per(10)
      end
    end
     
    def new
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        tweet.created_date=Date.today
        if tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end

    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end

    private
    def tweet_params
      params.require(:tweet).permit(:subject, :time, :image)
    end
end
