# README

docker compose up --build
docker compose run web rake db:create

In a separate terminal while the application is running:
MAC Only: source ~/.zshrc (update paths to ruby version)

docker compose exec web bash
rake db:migrate
rake db:seed