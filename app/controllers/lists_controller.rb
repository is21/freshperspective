class ListsController < ApplicationController

  before_action :init_twitter, except: [:index]

    def index
    end

    def new
    end

    def create
      begin
        username = params[:username]
        list = @client.create_list(username, options = {mode: "private", description: "List created using FreshPerspective"})
        friends = @client.friend_ids(username, options = {cursor:-1, count: 1000})
        friends.each_slice(100) do |slice|
          @client.add_list_members(list.id, slice)
        end
        redirect_to list.uri.to_s
      rescue Twitter::Error => e
        flash[:danger] = "#{e.message}"
        redirect_to new_list_path
      end
    end

    private

    def init_twitter
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = current_user.token
        config.access_token_secret = current_user.secret
      end
    end
end
