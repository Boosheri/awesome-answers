require 'rails_helper'

RSpec.describe NewsArticle, type: :model do
  
  def news_article
    @news_article ||= NewsArticle.new(
      title: "Awesome Article",
      description: "Some valid description"
    )
  end
  
  describe "validates" do
    # it("titlizes the title") do
    #   # GIVEN
    #   # An instance of a JobPost (without a title)
      
    #   news_article.title = nil

    #   # WHEN
    #   # Validations are triggered (or WHEN we attempt to save the JobPost)
    #   news_article.valid?


    #    expect(news_article.errors.messages).to(have_key(:title))
    # end


    # it 'requires a unique title' do
    #   # GIVEN: one job post in the db and one instance
    #   # of job post with the same title:
    #   persisted_news_article = NewsArticle.create(title: "test title")
    #   news_article = NewsArticle.new(title: persisted_news_article.title)
    #   # WHEN
    #   news_article.valid?
    #   # THEN
    #   expect(news_article.errors.messages).to(have_key(:title))
    #   expect(news_article.errors.messages[:title]).to(include("has already been taken"))
    # end
  end

end
