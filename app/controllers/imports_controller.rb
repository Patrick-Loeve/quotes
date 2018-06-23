class ImportsController < ApplicationController

def new

end

def create
  uri = URI('http://quotesondesign.com/wp-json/posts?filter[orderby]=rand&filter[posts_per_page]=20')

  response = Net::HTTP.get(uri)
  json_quotes = JSON.parse(response)

  @quotes = []
  json_quotes.each do |quote|

   @quotes << Quote.create(source: quote['title'], quote:  ActionView::Base.full_sanitizer.sanitize(quote['content']), user_id: User.first.id )

  end
end




end
