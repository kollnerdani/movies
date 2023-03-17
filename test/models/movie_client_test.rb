require "test_helper"

class MovieClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "MovieClient is invalid if keyword nil" do
    client= MovieClient.new(keyword: nil)
    assert_not client.save
    puts "You can not search without keyword"
    puts "Passed"
  end

  test "MovieClient is invalid if there is a record on the database with the sam keyword and page" do
    client= MovieClient.new(keyword: MovieClient.last.keyword, page: 1 )
    assert_not client.save
    puts "Keyword and page combination is taken"
    puts "Passed"
  end

end
