namespace :dev do

  desc "Rebuild System"
  task :rebuild => ["db:drop", "db:setup", :fake]

  task :fake => :environment do
    User.delete_all
    Event.delete_all
    Attendee.delete_all

    puts "Creating fake date!"
    user = User.create!(:email => "mgleon08@gmail.com", :password => "12345678")

    50.times do |i|
      e = Event.create(:name => Faker::App.name )
      10.times do |j|
        e.attendees.create(:name => Faker::App.name )
      end
    end
  end
end