class FormatSeeder
  class << self
    def formats
      [
        'VHS',
        'Betamax',
        'DVD',
        'Blu-ray',
        'HD-DVD'
      ]
    end

    def seed!
      formats.each do |name|
        Format.find_or_create_by!(name: name)
      end
    end
  end
end
