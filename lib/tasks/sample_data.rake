namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(username: "Admin",
                 email: "admin@soapbox.com",
                 password: "password",
                 password_confirmation: "password")
    #admin.toggle!(:admin)

    10.times do |n|
      name  = Faker::Name.first_name
      email = "user#{n}@soapbox.com"
      password  = "password"
      User.create!(username: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all()
    (User.all().length*5).times do
      content = Faker::Company.catch_phrase
	  choice0 = Faker::Company.name
	  choice1 = Faker::Company.name
	  description0 = Faker::Company.bs
	  description1 = Faker::Company.bs
      user = User.all()[rand(User.all().length)]
	  user.questions.create!(content: content, :choices_attributes => {0 => {content: choice0, description: description0}, 1 => {content: choice1, description: description1}})
	end
    
	choices = Choice.all()
	(3*choices.length).times do
		comment = Faker::Company.catch_phrase
		choice = Choice.all()[rand(Choice.all().length)]
		choice.comments.create!(content: comment, user_id: rand(User.all().length)+1)
	end
	(5*choices.length).times do
		choice = Choice.all()[rand(Choice.all().length)]
		choice.votes.create(user_id: rand(User.all().length)+1)
	end
	(2*Comment.all().length).times do
		comment = Comment.all()[rand(Comment.all().length)]
		comment.likes.create(user_id: rand(User.all().length)+1)
		comment.dislikes.create(user_id: rand(User.all().length)+1)
	end
	
	    
  end
end
