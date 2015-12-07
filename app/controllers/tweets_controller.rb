class TweetsController < ApplicationController

layout "application"
before_action :confirm_logged_in
before_action :isAdmin , :only => [:index]
  def index
    @tweets = Tweet.sorted
  end

  def show
    @tweetsFinder = Tweet.where("lat=? AND lon=?",session[:lat],session[:lon])
    @tweets = @tweetsFinder.sorted
  end

  def hot
    @tweetsFinder = Tweet.where("lat=? AND lon=?",session[:lat],session[:lon])
    @tweets = @tweetsFinder.best
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = session[:user_id]
    @tweet.lat = session[:lat]
    @tweet.lon = session[:lon]
    @tweet.username = session[:username]
    if @tweet.save
      flash[:notice] = "Tweet created successfully."
      redirect_to(:action => 'show') and return
    else
      message = @tweet.errors.full_messages
      flash[:error] = "#{message}"
      redirect_to(:action => 'show')
    end
  end

  def amplify
    @tweet = Tweet.find(params[:id])
    session[:return_to] ||= request.referer
    if @tweet.voters == nil
      @tweet.voters = ""
    end
    if @tweet.voters.include? session[:username]
      flash[:error] = "You can only vote once."
      redirect_to session.delete(:return_to) and return
    else
    @tweet.amp += 1
    @tweet.voters << session[:username]
    end
    # Update the object
    if @tweet.update_attributes(amp)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Tweet amplifyed successfully"
      redirect_to session.delete(:return_to)
    end
  end

  def destroy
    tweet = Tweet.find(params[:id]).destroy
    flash[:notice] = "Tweet '#{tweet.id}' destroyed successfully."
  redirect_to(:action => 'index')
  end

private

  def tweet_params
    params.require(:tweet).permit(:tweet, :lat, :lon, :user_id)
  end

  def amp
    params.permit(:amp)
  end

end
