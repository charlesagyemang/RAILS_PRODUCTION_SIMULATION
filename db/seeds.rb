
TOPICS = [
    'sql',
    'java',
    'html',
    'javascript',
    'elixir',
    'rails',
    'css',
    'ruby'
]


# 1000000.times do |val|
#     puts "====== CREATING USER #{val + 1} ====="
#     Author.create do |author|
#         author.name    = Faker::Name.unique.name
#         author.email   = Faker::Internet.email
#         author.country = Faker::Address.country
#         author.birth   = Faker::Date.birthday(min_age: 18, max_age: 65)
#     end
# end


# 10000.times do |val|
#     puts "=========== CREATING BOOK NUMBER #{val} ============"
#     Book.create do |book|
#         book.title = Faker::Book.title
#         book.pages = Faker::Number.number(digits: 4).to_s
#         book.published_date = Faker::Date.between_except(from: 10.year.ago, to: 1.year.from_now, excepted: Date.today)
#         book.topic = TOPICS.sample
#         book.isbn = Faker::Number.leading_zero_number(digits: 10)
#         book.author = Author.take
#     end
# end