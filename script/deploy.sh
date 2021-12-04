
# bash deploy.sh ecos-hub

app_name=$1

heroku create app_name
git remote -v
git push heroku main

heroku run rake db:migrate
heroku run rake db:seed