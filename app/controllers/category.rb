get '/categories' do
  @categories = Category.all
  erb :'category/index'
end