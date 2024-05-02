
require 'mechanize'

# Creating a Mechanize agent
agent = ::Mechanize.new

# Defining the method when going to a page
def print_naver_page(url)
  puts "Going to #{url}"
end

# Defining the method when landing on a page
def print_landing(url)
  puts "Landing on #{url}"
end

url = ""

# registering a call back to print when gonig to the page
agent.pre_connect_hooks << lambda do |_, request|
  print_naver_page(request.uri.to_s)
end

# registering a call back to print when landing on the page
agent.post_connect_hooks << lambda do |_, response|
  print_landing(response.uri.to_s)
end

page = agent.get(url)

# Close the agent
agent.shutdown