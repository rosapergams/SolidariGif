get '/gifs/:id/comments' do |id|
  @gif_id = id
  @comments = Comment.where(gif_id: id)
  erb :'comment/index', layout: false
end

get '/gifs/:id' do |id|
  @gif = Gif.find(id)
  @user_id = current_user.id
  @gif_id = id
  erb :'gif/show'
end

post '/comments' do
  @comment = Comment.create(params[:comment])
  redirect ("/gifs/#{@comment.gif_id}")
  # if @comment.save
  #   redirect ("/gifs/#{@comment.gif_id}")
  # else
  #   redirect ('/gifs/#{@comment.gif_id}')
  # end
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