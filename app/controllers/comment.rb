get '/gifs/:id/comments' do |id|
  @gif_id = id
  @comments = Comment.where(gif_id: id)
  @gifs = Gif.where(category_id: id)
  erb :'coment/index'
end