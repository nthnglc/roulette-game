desc "This task is called by the Cron To Go"
task :roulette_roll => :environment do
  RouletteRoll.roll
end

task :daily_bonus => :environment do
  User.bonus
end