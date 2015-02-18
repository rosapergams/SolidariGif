get '/gifs' do
  redirect 'categories'
end

get 'categories/:id/gifs/new' do |id|
  @user_id = current_user.id
  @category_id = id
  erb :'gif/new'
end

post '/gifs' do
  @gif = Gif.new(params[:gif])
  if @gif.save
    redirect ("/gifs/#{{@gif.id}}")
  else
    redirect ("/categories")
  end
end

get 'gifs/:id' do |id|
  @comment Comment.where(gif_id: id)
  @gif = Gif.find(id)
  erb :'gif/show'
end