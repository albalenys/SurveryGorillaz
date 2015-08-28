1000.times { User.create(email: Faker::Internet.email, password_digest: Faker::Internet.password, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name) }

10.times do
  user = User.create(email: Faker::Internet.email, password_digest: Faker::Internet.password, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  survey = user.surveys.create(title: Faker::Name.title)
    4.times do
      questions = survey.questions.create(content: Faker::Lorem.sentence)
        5.times do
          questions.choices.create(content: Faker::Lorem.sentence)
          QuestionResponse.create(choice_id: Choice.all.sample.id, question_id: Question.all.sample.id, survey_id: Survey.all.sample.id, user_id: User.all.sample.id)
        end
    end
end
