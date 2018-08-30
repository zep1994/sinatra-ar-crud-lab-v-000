
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
    erb :'new.html'
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    erb :'show.html'
  end
   #READ 
  get '/posts' do
    @posts = Post.all
    erb :'index.html'
  end
   
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'show.html'
  end
   #UPDATE
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'edit.html'
  end
  
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :'show.html'
    #shortform update
      #@post = Post.find(params[:id])
      #@post.update(name: params[:name], content: params[:content])
  end
   #DELETE 
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :'delete.html'
  end

  
end
