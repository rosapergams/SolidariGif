get '/gifs' do # display a list of all gifs
  redirect ("/categories")
end

get '/categories/:id/gifs/new' do |id|# return an HTML form for creating a new gif
  @user_id = current_user.id
  @category_id = id
  erb :'gif/new'
end

post '/gifs' do # create a new gif
  @gif = Gif.new(params[:gif])
  if @gif.save
    redirect ("/gifs/#{@gif.id}")
  else
    redirect ("/categories")
  end
end

get '/gifs/:id' do |id|
  @comments = Comment.where(gif_id: id) # display a specific gif
  @gif = Gif.find(id)
  erb :'gif/show'
end

get '/gifs/:id/edit' do |id| # return an HTML form for editing a gif
  @user_id = current_user.id
  @gif = Gif.find(id)
  erb :'gif/edit'
end

put '/gifs/:id' do |id| # update a specific gif
  @gif = Gif.find(id)
  @gif.update(params[:gif])
  redirect ("/gifs/#{@gif.id}")
end

delete '/gifs/:id' do |id| # delete a specific gif
  @gif = Gif.find(id)
  @gif.destroy
  redirect "/categories/#{@gif.category_id}" # redirect to 'categories/:id'
end