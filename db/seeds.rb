# User
# puts "Clearing users"
# User.delete_all #if Rails.env == "DEVELOPMENT"

# puts "Creating Test user..."

# User.create!(
# 	email: "test@test.com",
# 	password: "aaaaaa",
# 	)

# ------------------------------------------------------

# Sections
puts "Clearing all Questions..."
Question.delete_all #if Rails.env == "DEVELOPMENT"
puts "Clearing all Sections..."
Section.delete_all #if Rails.env == "DEVELOPMENT"

puts "Creating Sections Informationen zur Beschaffung, Farbenpräferenz, ..., ..."

section_1 = Section.create!(name: "Informationen zur Beschaffung", description: "Hier werden generelle Informationen zur Beschaffung bhandelt.")
section_2 = Section.create!(name: "Farbenpräferenz", description: "Hier werden die conditional forms getested.")

puts "Created #{Section.count} new Sections!"

# ------------------------------------------------------

# Questions

puts "Creating Questions for #{Section.count} Sections..."

# Questions for Section 1
question_1 = Question.create!(section: section_1, additional_information: Faker::Lorem.sentence(word_count: 7), id_name: "beschaffungsstelle", content: "Welches ist deine Beschaffungsstelle?")
question_2 = Question.create!(section: section_1, additional_information: Faker::Lorem.sentence(word_count: 7), id_name: "farbe", content: "Welches ist deine Lieblingsfarbe")

# Questions for Section 2
question_3 = Question.create!(section: section_2, additional_information: Faker::Lorem.sentence(word_count: 7), id_name: "weitere_praeferenz", content: "Welche Farbe magst du auch noch?")

question_4 = Question.create!(section: section_2, additional_information: Faker::Lorem.sentence(word_count: 7), id_name: "blau", content: "Gute Wahl, blau finde ich gut, so als zweite Wahl. Wieviele Blau willst du?", data_type: "number")
question_5 = Question.create!(section: section_2, additional_information: Faker::Lorem.sentence(word_count: 7), id_name: "blau_1", content: "Warum willst du diese Anzahl?", data_type: "text")


question_6 = Question.create!(section: section_2, additional_information: Faker::Lorem.sentence(word_count: 7), id_name: "gruen", content: "Classy, grün gefällt mir auch ganz gut? Willst du auch grün mit rot?", data_type: "boolean")

puts "Created #{Question.count} Questions!"

# ------------------------------------------------------

puts "ExSeedingly succSeeded!!!"