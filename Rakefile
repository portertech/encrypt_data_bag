require "bundler/gem_tasks"
require "fileutils"

task :test do
  FileUtils.rm_f(Dir.glob("test/tmp/*.{rb,json}"))
  timestamp = Time.now.to_i
  command = ["bundle exec ./bin/encrypt_data_bag"]
  command << "-s test/assets/encrypted_data_bag_secret"
  command << "-i test/assets/data_bags/aws/staging.rb"
  command << "-o test/tmp/staging.json"
  system(command.join(" "))
  command = ["bundle exec ./bin/encrypt_data_bag"]
  command << "-s test/assets/encrypted_data_bag_secret"
  command << "-i test/assets/data_bags/aws/production.json"
  command << "-o test/tmp/production.rb"
  system(command.join(" "))
  puts IO.read("test/tmp/staging.json")
  puts IO.read("test/tmp/production.rb")
end

task :default => :test
