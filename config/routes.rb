Rails.application.routes.draw do
  get "/", :controller => "places", :action => "index"
  get "/", :controller => "posts", :action => "index"
  resources "places"
  resources "posts"
  resources "sessions"
  resources "users"
  get "/login", :controller => "sessions", :action => "new"
  get "/logout", :controller => "sessions", :action => "destroy"
end
