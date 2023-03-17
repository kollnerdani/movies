class HomeController < ApplicationController
  def search
    if params[:query].present?
      @client = MovieClient.new(keyword: params[:query])
      @client.page = params[:page] if params[:page].present?
      @movies = @client.search[0]
      @process = @client.search[1]
    else
      if MovieClient.last
        @client =  MovieClient.last
        @movies = JSON.parse(@client.result)
      else
        @movies =[]
      end
    end
  end
end
