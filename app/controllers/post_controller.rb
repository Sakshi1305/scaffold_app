class PostController < ApplicationController

  def index
  	response = RestClient.get 'https://jsonplaceholder.typicode.com/posts'
  	json = JSON.parse response

  	if !json.nil?
  		json.map do |post|
  			unless post.present?
  			  Post.create(user_id: "#{post["userId"]}", title: "#{post["title"]}", body: "#{post["body"]}")
  			end
  		end
  	else
  		"error seedinf post"
  	end
  	@posts = Post.all
  end

  def show
  end
end


