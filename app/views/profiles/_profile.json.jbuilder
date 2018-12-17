json.(user, :id,:name, :email, :created_at, :profile.name)

json.avatar_url url_for(user.profile.avatar.url)
#json.token user.generate_jwt
