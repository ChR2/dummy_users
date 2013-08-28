enable :sessions

get '/' do
  erb :index
end

get '/register' do
  erb :register
end

post '/register' do
  @new_user = User.create(:first_name => params[:first_name],
                          :last_name => params[:last_name],
                          :email => params[:email],
                          :username => params[:username],
                          :password => params[:password]
    )
  erb :register
end

get '/personal_page' do
  redirect to "/" if current_user.nil?
  erb :personal_page
end

get '/logout' do
  session.clear
  redirect to "/"
end


post '/login' do
  @user = User.find_by_username(params[:username])
  p params
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect to "/personal_page"
  else
    erb :index
  end
end
