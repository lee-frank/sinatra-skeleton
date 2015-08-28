helpers do
	def current_user
	  @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
	end
end

# GET

get '/index' do
	erb :index
end 

get '/login' do
	erb :login
end

get '/profile' do
	erb :profile
end

get '/signup' do
	erb :signup
end

get '/logout' do
	session[:user_id] = ""
	redirect "/index"
end

get '/movies' do
	erb :movies
end

post '/movies' do
	title = params[:title] 
	diretor = params[:director]
	image_url = params[:image_url]

	Movie.create({
		title: title,
		director: director,
		image_url: image_url
	})

	redirect("/")
	# movie = params (hash datatype)

end

get '/movies/:id' do
	@movie = Movie.find(params[:id])
	erb :show_movie
end

# POST
post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user.password == password
    session[:user_id] = user.id
    redirect "/index"
  else
    redirect "/login"
  end
end

post '/signup' do
  username = params[:email]
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email)
  if user
    redirect '/index'
  else
    user = User.create(username: username, password: password, email:email)
    session[:user_id] = user.id
    redirect '/signup'
  end
end

post '/profile' do
    redirect '/'
end

#LOGOUT


