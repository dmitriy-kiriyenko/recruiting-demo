User.destroy_all
Folder.destroy_all


user1 = User.create(email: 'a@a.a', password: '111')
user2 = User.create(email: 'b@b.b', password: '111')

folder1 = user1.folders.create(name: 'First folder')
folder2 = user1.folders.create(name: 'Second folder')
          user1.folders.create(name: 'Third folder')

user2.folders.create(name: 'Folder first')
user2.folders.create(name: 'Folder second')
user2.folders.create(name: 'Folder third')

def seed_image(file_name)
  File.open(File.join(Rails.root, "/db/seed/#{file_name}"))
end

folder1.images.create(file: seed_image('1.jpeg'))
folder1.images.create(file: seed_image('2.png'))
folder2.images.create(file: seed_image('3.jpg'))
