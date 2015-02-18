get '/users/:id' do |id|
  @user = User.find(id)
  erb :'user/show'
end

get '/users/:id/edit' do |id|
    @user = User.find(id)
    erb :'user/edit'
end

put '/users/:id' do |id|
    @user = User.find(id)
    @user.update(params[:user])
    redirect ("/users/#{@user.id}")
end

delete '/users/:id' do |id|
    @user = User.find(id)
    User.find(id).destroy
    session[:user_id] = nil
    redirect "/"
end