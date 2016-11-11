require 'faker'

User.destroy_all
Folder.destroy_all

def set_public_activity_user(user)
  Thread.current[:public_activity_controller] = OpenStruct.new(current_user: user)
end

user1 = User.create(email: 'a@a.a', password: '111')
user2 = User.create(email: 'b@b.b', password: '111')

set_public_activity_user user1
folder1 = user1.folders.create(name: 'First folder')
folder2 = user1.folders.create(name: 'Second folder')
          user1.folders.create(name: 'Third folder')

set_public_activity_user user2
user2.folders.create(name: 'Folder first')
user2.folders.create(name: 'Folder second')
user2.folders.create(name: 'Folder third')

def seed_image(file_name)
  File.open(File.join(Rails.root, "/db/seed/#{file_name}"))
end

set_public_activity_user user1
image1 = folder1.images.create(file: seed_image('alex.jpeg'))
         folder1.images.create(file: seed_image('dima.png'))
         folder2.images.create(file: seed_image('kris.jpg'))

set_public_activity_user user1
comment1 = image1.comments.create(body: Faker::Name.title)
           image1.comments.create(body: Faker::Name.title)
           image1.comments.create(body: Faker::Name.title)

comment1.comments.create(body: Faker::Name.title)
comment1.comments.create(body: Faker::Name.title)

puts 'Updated...'
