require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  	test "should not save article without title" do
		  article = Article.new
		  # puts article
		  # p article.save
		  assert article.save , "title not given"
 	end
end
