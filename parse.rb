require 'open-uri'
require 'nokogiri'

url = ARGV[0]
parsed = Nokogiri::HTML.parse(open(url))

btn = 1

while btn do
  btn = parsed.at_css('a.category-page__pagination-next')
  links = parsed.css('a.category-page__member-link')
  links.each do |tag|
    puts tag.text
  end
  if btn then
    url = btn[:href]
    parsed = Nokogiri::HTML.parse(open(url))
  end
end

