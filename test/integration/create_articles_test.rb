require 'test_helper'
# test to create a new article called "New Query"
class CreateArticlesTest < ActionDispatch::IntegrationTest

  test "get new article form and create article" do
      get new_article_path
        assert_template 'articles/new'
          assert_difference 'Article.count', 1 do
post_via_redirect articles_path, article: {title: "New Query", description: "Test new query"}

      end

        assert_template 'articles/index'
        assert_match "New Art", response.body

  end
end
