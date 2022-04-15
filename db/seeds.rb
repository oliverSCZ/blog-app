User.destroy_all

first_user = User.create(posts_counter: 0, name: 'Hola', photo: 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80', email: 'user1@mail.com', bio: 'Lorry driver in UK.', confirmation_token: 'BzB_L3xFSz5zfy4fq9Pk', confirmed_at: Time)
second_user = User.create(posts_counter: 0, name: 'Tom', photo: 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80', email: 'user2@mail.com', bio: 'Teacher from Mexico.', confirmation_token: 'PyP_CmMzWJAzU_RgppBR', confirmed_at: Time)
third_user = User.create(posts_counter: 0, name: 'Lilly', photo: 'https://images.unsplash.com/photo-1521146764736-56c929d59c83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', email: 'user3@mail.com', bio: 'Teacher from Poland.', confirmation_token: 'Z6nKTH-7Poyj2kxW9uei', confirmed_at: Time)
admin = User.create(posts_counter: 0, name: 'Admin', photo: 'https://images.unsplash.com/photo-1521146764736-56c929d59c83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', email: 'admin@mail.com', bio: 'Teacher from Poland.', confirmation_token: 'Z6nKTH-7Poyj2kxW9uhy', confirmed_at: Time, role: 'admin')

first_post = Post.create(comments_counter: 0, likes_counter: 0,  author_id: first_user.id, title: 'Hello', text: 'Chocolate is gooood')
second_post = Post.create(comments_counter: 0, likes_counter: 0,  author_id: first_user.id, title: 'Hello 2', text: 'This is my second post.')
third_post = Post.create(comments_counter: 0, likes_counter: 0,  author_id: first_user.id, title: 'Ola', text: 'This is my third post.')
fourth_post = Post.create(comments_counter: 0, likes_counter: 0,  author_id: first_user.id, title: 'Ola 2', text: 'This is my fourth post.')
fifth_post = Post.create(comments_counter: 0, likes_counter: 0,  author_id: second_user.id, title: 'BauBau', text: 'First post for second_user.')
sixth_post = Post.create(comments_counter: 0, likes_counter: 0,  author_id: second_user.id, title: 'BauBauBau', text: 'Second post for second_user.')
seventh_post = Post.create(comments_counter: 0, likes_counter: 0, author_id: third_user.id, title: 'Yes, I am here', text: 'First post for third_user.')
eigth_post = Post.create(comments_counter: 0, likes_counter: 0,  author_id: third_user.id, title: 'Yes, I am gone', text: 'Second post for third_user.')

Comment.create(post: first_post, author: second_user, text: 'Hi Oli!' )
Comment.create(post: first_post, author: third_user, text: 'Hi Mathew!')
Comment.create(post: first_post, author: third_user, text: 'Hi Max from first user!' )
Comment.create(post: first_post, author: first_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: third_user, text: 'Hi Tomas!' )
Comment.create(post: first_post, author: first_user, text: 'Hi Lilly!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Lillian!' )
Comment.create(post: second_post, author: second_user, text: 'Hi Max from second user!' )
Comment.create(post: second_post, author: third_user, text: 'Hi Max from third user!' )
Comment.create(post: third_post, author: first_user, text: 'Hi Max from first user!' )

p "Creadas #{User.count} usuarios"