class MovieClient < ApplicationRecord
  validates :keyword, presence: true, allow_blank: false
  validates_uniqueness_of :keyword, scope: :page
  def search
    #basic search on database
    # TODO Integrate complex search on the database to avoid store hundred times the same misspelled search, pg_search on keywords
    if self.valid?
      response =  RestClient.get "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['API_KEY']}&page=#{self.page}&language=en-US&query=#{self.keyword}&include_adult=false"#,
      self.result = response.body
      self.save
      @movies = [JSON.parse(response.body), "Api call in progress" ]
    else
      if MovieClient.exists?(keyword: self.keyword, page: self.page)
        @client = MovieClient.find_by(keyword: self.keyword, page: self.page)
        @client.update(hit: (@client.hit + 1))
        @movies = [JSON.parse(@client.result), "Database call in progress"]
      else
        @movies = []
      end
    end
  end
end
