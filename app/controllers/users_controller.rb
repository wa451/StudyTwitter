class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @user.sum = @user.tweets.all.sum(:time)
        @user.level = @user.sum.to_i / 60
        @user_exp=100*(@user.sum%60)/60
    end

    def index
        @users = User.all
    end
end
