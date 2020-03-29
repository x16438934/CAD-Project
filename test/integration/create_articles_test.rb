require 'test_helper'
# test to create a new article called "New Art"
class CreateArticlesTest < ActionDispatch::IntegrationTest

  test "get new article form and create article" do
      get new_article_path
        assert_template 'articles/new'
          assert_difference 'Article.count', 1 do
post_via_redirect articles_path, article: {title: "New Art", description: "Test new art"}

      end

        assert_template 'articles/index'
        assert_match "New Art", response.body

  end
end
