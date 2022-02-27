class UsersController < ApplicationController
    layout "main"
    def show
        @user = User.find(params[:id])
        @user.sum = @user.tweets.all.sum(:time)
        @user.level = @user.sum.to_i / 60
        @user_exp=100*(@user.sum%60)/60

        
        @tweets = @user.tweets.page(params[:page]).reverse_order
        @today_tweet =  @tweets.where(created_at: Time.zone.now.all_day)
        @yesterday_tweet = @tweets.where(created_at: 1.day.ago.all_day)
        @two_days_ago_tweet = @tweets.where(created_at: 2.days.ago.all_day)
        @three_days_ago_tweet = @tweets.where(created_at: 3.days.ago.all_day)
        @four_days_ago_tweet = @tweets.where(created_at: 4.days.ago.all_day)
        @five_days_ago_tweet = @tweets.where(created_at: 5.days.ago.all_day)
        @six_days_ago_tweet = @tweets.where(created_at: 6.days.ago.all_day)
        @tweet=Tweet.new
    end

    def index
        @users = User.all
    end
end
