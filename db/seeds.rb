# Limpiar la base de datos
User.destroy_all
Post.destroy_all
Comment.destroy_all

# Crear usuarios de ejemplo
10.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    first_name: "Usuario#{i + 1}",
    last_name: "Apellido#{i + 1}",
    password: "password123",
    password_confirmation: "password123"
  )
end

# Crear publicaciones de ejemplo
10.times do |i|
  Post.create!(
    title: "Post #{i + 1}",
    content: "Este es el contenido del post #{i + 1}.",
    published: i.even? ? 1 : 0,
    author: User.find(i + 1).email,
    user_id: User.find(i + 1).id
  )
end

# Crear comentarios de ejemplo
10.times do |i|
  Comment.create!(
    content: "Comentario #{i}.",
    author: User.find(i + 1).email,
    post_id: Post.find(i + 1).id
  )
end
