heroku pg:backups:capture
heroku pg:backups:download
mv latest.dump /home/malaquias/Downloads/Bancos/studiodropbox
rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1 db:create
pg_restore --verbose --clean -U postgres -d studio_dropbox_development /home/malaquias/Downloads/Bancos/studiodropbox
rails s -p 3001