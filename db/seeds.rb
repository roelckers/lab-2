User.destroy_all
Post.destroy_all
Comment.destroy_all

10.times do |i|
  user = User.create!(
    email: "user#{i}@example.com",
    first_name: "FirstName#{i}",
    last_name: "LastName#{i}",
    password: "password"
  )

  post = Post.create!(
    title: "Post #{i}",
    content: "Este es el contenido del post #{i} con más de 140 caracteres para cumplir con la validación de longitud." * 2,
    published: [0, 1].sample,
    author: user.email,
    user: user
  )

  10.times do |j|
    Comment.create!(
      content: "Este es el comentario #{j} en el post #{i}.",
      author: user.email,
      post: post,
      user: user
    )
  end
end
