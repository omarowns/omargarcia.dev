web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
worker: bin/sidekiq -C config/sidekiq.yml
release: bundle exec rake db:migrate
