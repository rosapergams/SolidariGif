get '/categories' do
  @categories = Category.all
  erb :'category/index'
end

get '/categories/:id' do |id|
  @gifs = Gif.where(category_id: id)
  @category = Category.find(id)
  erb :'category/show'
end