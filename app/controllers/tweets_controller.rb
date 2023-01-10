class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
        @tweets = Tweet.all
    end
  # 追加場所ここから
  def new
    @tweet = Tweet.new
  end
# ここまで
def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
  def show
    @tweet = Tweet.find(params[:id])
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
    params.require(:tweet).permit(:body)
  end
  #ここまで

end
