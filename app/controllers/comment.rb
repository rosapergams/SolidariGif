get '/gifs/:id/comments' do |id|
  @gif_id = id
  @comments = Comment.where(gif_id: id)
  @gifs = Gif.where(category_id: id)
  erb :'coment/index'
end

get 'gifs/:id/comments/new' do |id|
  @user_id = current_user.id
  @gif_id = id
  erb :'comment/new'
end

post '/comments' do
  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect ("/gifs/#{@comment.gif_id}")
  else
    redirect ("/gifs/#{@gif.id}/comments/new")
  end
end