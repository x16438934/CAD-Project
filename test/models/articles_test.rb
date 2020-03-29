
require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
# a test to create a new title
def setup
  @article = Article.new(title: "example")
end
# test to create a description
test "create a description"do
  @article = Article.new(description: "This is an example")
end
# test to see if the article is valid
test "article should be valid" do
  assert @article.valid?
end

end
