
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/posts'
  end
  
  #CREATE
  get '/posts/new' do 
    erb :'new.erb'
  end
  
  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    erb :'show.html'
  end
  
  #READ 
  post '/posts' do
    @post = Post.all 
    erb :'index.html'
  end
  
  post '/posts/:id' do
    @post = Post.find(params[:id]) 
    erb :'show.html'
  end
  
  #UPDATE
  post '/posts/:id/edit' do
    @post = Post.find(params[:id]) 
    erb :'edit.html'
  end
  
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :'show.html'
    
  end
   #DELETE 
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :'delete.html'
  end

  
end
