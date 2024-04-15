# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Processador marca: 1- Intel; 2 - AMD
[
  {descricao: 'Core i5', marca: 1},
  {descricao: 'Core i7', marca: 1},
  {descricao: 'Ryzen 5', marca: 2},
  {descricao: 'Ryzen 7', marca: 2},
].each do |processador|
  Processador.find_or_create_by(processador)
end
puts "Seed Processador"

# Placa Mãe - tipo_processador Intel - 1; AMD - 2; ambas - 3
[
  {descricao: 'Asus ROG', tipo_processador: 1, quantidade_slot_memoria_ram: 2, total_memoria_ram: 16, video_integrado: false},
  {descricao: 'Gigabyte Aorus', tipo_processador: 2, quantidade_slot_memoria_ram: 2, total_memoria_ram: 16, video_integrado: false},
  {descricao: 'ASRock Steel Legend', tipo_processador: 3, quantidade_slot_memoria_ram: 4, total_memoria_ram: 64, video_integrado: true}
].each do |placa_mae|
  PlacaMae.find_or_create_by(placa_mae)
end
puts "Seed Placa Mãe"

# Memoria RAM
[4, 8, 16, 32, 64].each do |tamanho_memoria|
  MemoriaRam.find_or_create_by(descricao: 'Kingston Hiper X', tamanho: tamanho_memoria)
end
puts "Seed Memoria RAM"

# Video Integrado
[
  'Evga Geforce RTX 2060 6GB',
  'Asus ROG Strix Geforce RTX 3060 6GB',
  'Gigabyte Radeon RX 6600 XT EAGLE 8GB'
].each do |video|
    PlacaDeVideo.find_or_create_by(descricao: video)
end
puts "Seed Video Integrado"