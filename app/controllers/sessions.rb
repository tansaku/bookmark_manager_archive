get '/sessions/new' do
	erb :"sessions/new", :layout => !request.xhr?
end


post '/sessions' do
	email, password = params[:email], params[:password]
	user = User.authenticate(email, password)

	if user
		session[:user_id] = user.id
		redirect to('/')
	else
		flash.now[:errors] = ["The email or password is incorrect"]
		erb :"sessions/new"
	end

end

delete '/sessions' do
	flash[:notice] = "Good Bye!"
	session[:user_id] = nil
	redirect to('/')
end