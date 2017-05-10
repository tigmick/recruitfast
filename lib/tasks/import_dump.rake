namespace :import_dump do
  desc "TODO"
  task app: :environment do
    (1..30).each do |number|
      user = User.create({  
       "email"   =>"client#{number}@gmail.com",
       "contact_no"   =>887100000+number,
       "first_name"   =>"Seller #{number}",
       "last_name"   =>"Seller #{number}",
       "current_location"   =>"AB Rd, Near Malhar Mall, Vijay Nagar #{number}",
       "password" => "12345678",
       "role" => "client"
    })  
    user.save  
      (1..10).each do |number_product|
        job = user.jobs.new({
          "title"=>"Test Job #{number_product}",
          "description"=>"Test Jobs Description #{number_product}"
        })
        job.save
      end
    end
  end
end