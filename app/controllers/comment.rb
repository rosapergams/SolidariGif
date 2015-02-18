get '/gifs/:id/comments' do |id|
  @gif_id = id
  @comments = Comment.where(gif_id: id)
  erb :'comment/index', layout: false
end

get '/gifs/:id/comments/new' do |id|
  @user_id = current_user.id
  @gif_id = id
  erb :'comment/new'
end

post '/comments' do
  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect ("/gifs/#{@comment.gif_id}")
  else
    redirect ('/gifs/#{@gif.id}/comments/new')
  end
end

get '/comments/:id' do |id|
  @comments = Comment.where(comment_id: id)
  @comment = Comment.find(id)
  erb :'comment/show'
end

get '/comments/:id/edit' do |id|
  @user_id = current_user.id
  @comment = Comment.find(id)
  erb :'comment/edit'
end

put '/comments/:id' do |id|
  @comment = Comment.find(id)
  @comment.update(params[:comment])
  redirect ("/gifs/#{@comment.gif_id}")
end

delete '/comments/:id' do |id|
  @comment = Comment.find(id)
  @comment.destroy
  redirect "/gifs/#{@comment.gif_id}"
end