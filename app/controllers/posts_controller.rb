class PostsController < ApplicationController

  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    if @current_user
      @post = Post.new
      @post["user_id"] = @current_user["id"]
      @post["title"] = params["post"]["title"]
      @post["image"] = params["post"]["image"]
      @post.uploaded_image.attach (params["post"]["uploaded_image"])
      @post["description"] = params["post"]["description"]
      @post["posted_on"] = params["post"]["posted_on"]
      @post["place_id"] = params["post"]["place_id"]
      @post.save
      redirect_to "/places/#{@post["place_id"]}"
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/posts"
  end

end
