# README

create a .env file in the root directory of the project called .env
contents of .env:
OPENAI_ACCESS_TOKEN = "our-secret-key-here"

docker compose up --build
docker compose run web rake db:create

In a separate terminal while the application is running:
MAC Only: source ~/.zshrc (update paths to ruby version)

docker compose exec web bash
rake db:migrate