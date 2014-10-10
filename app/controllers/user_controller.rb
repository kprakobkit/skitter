
# post new tweet
post '/user/:id/new' do
  # create a skeet for the user
  current_user.skeets.create(skeet: params[:skeet])
  @all_skeets = current_user.get_all_skeets
  erb :user_home
end

# displaying all the info for user view
get '/user/:id' do
  # bio
  # all their tweets
  @user = User.find(params[:id])
  # @user_followees = @user.followees
  @all_skeets = @user.get_all_skeets
  erb :user_home
end

get '/user/:id/profile/:partial' do
  "*" * 50
  p params[:partial]
  @partial = params[:partial]
  @user = User.find params[:id]

  erb :profile
end

post '/follow/:id' do
  @action = "follow"
  if logged_in?
    @user = User.find params[:id]
    unless current_user.followees.exists?(id: @user.id)
      current_user.followees << @user
    end
    erb :success
  else
    erb :not_logged_in
  end
end

post '/unfollow/:id' do
  @action = "unfollow"
  if logged_in?
    @user = User.find params[:id]
    current_user.followees.delete @user
    erb :success
  else
    erb :not_logged_in
  end
end

# Tested erb with temp routes
# get '/show_followers' do
#   erb :followers
# end

# get '/show_followees' do
#   erb :followees
# end
