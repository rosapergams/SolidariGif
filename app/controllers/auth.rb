get '/' do
  erb :'index'
end

get '/login' do
  # @error = "If at first you don't succeed, try, try again." if params[:error].
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
  if user.try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
    redirect '/categories'
  else
    redirect '/login' # ?error=true
  end
end

get '/signup' do
  # @error = "If at first you don't succeed, try, try again." if params[:error]
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/categories'
  else
    redirect "/signup" # ?error=true
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end