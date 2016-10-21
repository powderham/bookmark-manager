namespace :data_mapper do
  desc "Auto update DataMapper"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "DataMapper upgraded."
  end

  desc "Auto migrate DataMapper"
  task do
    DataMapper.auto_migrate!
  end
end
