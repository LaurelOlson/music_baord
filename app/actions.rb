helpers do 
  def current_user
    User.find(session[:id]) if session[:id]
  end
end

get '/' do
  @songs = Song.all
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  @review = Review.new
  erb :'songs/show'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
    user: current_user,
    url: params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

get '/users/sign_up' do
  @user = User.new
  erb :'users/sign_up'
end

post '/users/sign_up' do
  @user = User.new(
    username: params[:username],
    password: params[:password]
  )
  if @user.save
    session[:id] = @user.id
    redirect '/users/account'
  else
    erb :'users/sign_up'
  end
end

post '/users/login' do
  @user = User.find_by(username: params[:username], password: params[:password])
  if @user
    session[:id] = @user.id
    erb :'users/account' 
  else
    flash[:login_error] = 'Invalid username or password'
    redirect 'users/login'
    erb :'users/login'
  end
end

get '/users/account' do
  erb :'users/account'
end

get '/users/logout' do
  # session[:id] = nil # only deletes id key
  session.clear # deletes all keys
  redirect '/'
end

get '/up_vote/:id' do 
  current_song = Song.find params[:id]
  current_song.increment!(:count, 1) unless current_user.votes.find { |vote| vote.song == current_song }
  current_user.votes << Vote.new(user_id: current_user.id, song_id: current_song.id)
  @songs = Song.all
  redirect :'/songs'
end

get '/down_vote/:id' do
  current_song = Song.find(params[:id])
  current_song.increment!(:count, -1) unless current_user.votes.find { |vote| vote.song == current_song }
  current_user.votes << Vote.new(user_id: current_user.id, song_id: current_song.id)
  @songs = Song.all
  redirect :'/songs'
end

post '/reviews' do
  @review = Review.new(
    rating: params[:rating],
    review: params[:review],
    song_id: session[:song_id],
    user_id: current_user.id
  )
  if @review.save
    redirect "/songs/#{@review.song_id}"
  else
    erb :'users/sign_up'
  end
end
