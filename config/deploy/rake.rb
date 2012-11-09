desc "Run rake task"
task :rake do
  ARGV.shift

  task = ARGV.shift
  arguments = ARGV.join(' ')

  run "cd #{deploy_to}/current && RAILS_ENV=production bundle exec rake #{task} #{arguments}"
end

