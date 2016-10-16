class GenreSeeder
  class << self
    def genres
      [
        'Action',
        'Adventure',
        'Animation',
        'Comedy',
        'Horror',
        'Romance',
        'Science Fiction'
      ]
    end

    def seed!
      genres.each do |name|
        Genre.find_or_create_by!(name: name)
      end
    end
  end
end
