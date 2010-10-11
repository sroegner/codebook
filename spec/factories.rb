Factory.define :code_area do |c|
  c.name Faker::Lorem.words(1)
end

Factory.define :code_language do |l|
  l.name Faker::Lorem.words(1)
end

Factory.sequence :title do |n|
  "#{Faker::Company.name}#{n}"
end

Factory.define :code_document do |doc|
  doc.title { Factory.next(:title) }
  doc.description Faker::Lorem.paragraph
  doc.association :code_area, :factory => :code_area
  doc.association :code_language, :factory => :code_language
  doc.author_id 1
end
