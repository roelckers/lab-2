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

# Obtener todos los usuarios en una variable
users = User.all

# Crear publicaciones de ejemplo
10.times do |i|
  begin
    user = users[i] # Usuario correspondiente
    Post.create!(
      title: "Post #{i + 1}",
      content: "Este es el contenido del post #{i + 1} " * 2,
      published: i.even? ? 1 : 0,
      author: user.email,
      user_id: user.id,
      hashtags: ["ejemplo", "post#{i + 1}"]
    )
  rescue => e
    puts "Error al crear el Post #{i + 1}: #{e.message}"
  end
end

# Crear comentarios de ejemplo
10.times do |i|
  post = Post.find_by(id: i + 1)
  next unless post

  3.times do |j|
    begin
      Comment.create!(
        content: "Este es el comentario #{j + 1} en el post #{i + 1}.",
        author: post.user.email,
        post_id: post.id,
        user_id: post.user.id
      )
    rescue => e
      puts "Error al crear el comentario #{j + 1} en el post #{i + 1}: #{e.message}"
    end
  end
end
