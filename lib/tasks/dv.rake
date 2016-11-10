if Rails.env.development?
  namespace :db do

    desc 'Recreate database with seed for development environment'
    task recreate: :environment do
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
      Rake::Task['db:seed'].invoke
    end

  end
end
