Administrador.find_or_create_by(nome: "danilo", email: "danilo@99run.com", senha: "123456")


20.times do
  Faker::Config.locale = 'pt-BR'
  
  Usuario.create(
    nome: Faker::Name.name,
    email: Faker::Internet.email,
    senha: "123456"
  )
end