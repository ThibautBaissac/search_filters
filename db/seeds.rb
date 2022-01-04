genre = ["Comedy", "SF", "Action", "Animation"]

Movie.delete_all

ApplicationRecord.transaction do
  1000.times do
    Movie.create(
      title: Faker::Movie.title,
      release: rand(2010..2022),
      price: rand(3..30),
      genre: genre.sample,
    )
  end
end
