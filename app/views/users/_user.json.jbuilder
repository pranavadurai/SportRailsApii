json.(user, :id,:name, :email, :created_at, :profile)

json.avatar_url user.profile.avatar.url(:medium)
#json.token user.generate_jwt
