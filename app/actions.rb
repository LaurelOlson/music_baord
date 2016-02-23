helpers do 
  def current_user
    User.find(session[:id]) if session[:id]
  end
end

# Homepage (Root path)
get '/' do
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
  erb :'songs/show'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
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
    flash[:error] = 'Invalid username or password'
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