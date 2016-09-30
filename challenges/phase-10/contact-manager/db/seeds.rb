# This block will automatically empty the database every time db:seed is run.
ActiveRecord::Base.connection.tables.each do |table|
    # Don't clear our migration history! Clear everything else.
    if table != 'schema_migrations'
        # http://stackoverflow.com/a/7758797
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table};")
        # http://stackoverflow.com/questions/2097052/rails-way-to-reset-seed-on-id-field
        ActiveRecord::Base.connection.reset_pk_sequence! table
    end
end

contact_attributes = [
  { first_name: 'Eric', last_name: 'Kelly', phone_number: '1234567890' },
  { first_name: 'Adam', last_name: 'Sheehan', phone_number: '1234567890' },
  { first_name: 'Dan', last_name: 'Pickett', phone_number: '1234567890' },
  { first_name: 'Evan', last_name: 'Charles', phone_number: '1234567890' },
  { first_name: 'Faizaan', last_name: 'Shamsi', phone_number: '1234567890' },
  { first_name: 'Helen', last_name: 'Hood', phone_number: '1234567890' },
  { first_name: 'Corinne', last_name: 'Babel', phone_number: '1234567890' },
  { first_name: 'Bobby', last_name: 'Joe', phone_number: '1234567890' },
  { first_name: 'Peggy', last_name: 'Sue', phone_number: '1234567890' },
  { first_name: 'Johnny', last_name: 'Ray', phone_number: '1234567890' },
  { first_name: 'Billy', last_name: 'Bob', phone_number: '1234567890' },
  { first_name: 'Marlene', last_name: 'Watts', phone_number: '1234567890' },
  { first_name: 'Randy', last_name: 'Quate', phone_number: '1234567890' },
  { first_name: 'Jeff', last_name: 'Hipp', phone_number: '1234567890' },
  { first_name: 'Savannah', last_name: 'Correll', phone_number: '1234567890' },
  { first_name: 'Lindsay', last_name: 'Dunne', phone_number: '1234567890' },
  { first_name: 'Riley', last_name: 'Robinson', phone_number: '1234567890' },
  { first_name: 'Jibby', last_name: 'Job', phone_number: '1234567890' },
  { first_name: 'Jack', last_name: 'Smith', phone_number: '1234567890' },
  { first_name: 'Susan', last_name: 'Smith', phone_number: '1234567890' },
  { first_name: 'Seth', last_name: 'Hinshaw', phone_number: '1234567890' },
  { first_name: 'Lily', last_name: 'Rockwell', phone_number: '1234567890' },
  { first_name: 'John', last_name: 'Rockwell', phone_number: '1234567890' },
  { first_name: 'Fran', last_name: 'Taber', phone_number: '1234567890' },
  { first_name: 'Richard', last_name: 'Simon', phone_number: '1234567890' },
  { first_name: 'Conrad', last_name: 'Lindes', phone_number: '1234567890' },
  { first_name: 'Scott', last_name: 'King', phone_number: '1234567890' },
  { first_name: 'Bill', last_name: 'O\'Reilly', phone_number: '1234567890' },
  { first_name: 'Ghengis', last_name: 'Khan', phone_number: '1234567890' },
  { first_name: 'Donald', last_name: 'Trump', phone_number: '1234567890' },
  { first_name: 'Joseph', last_name: 'Stalin', phone_number: '1234567890' },
  { first_name: 'Bobby', last_name: 'Jindal', phone_number: '1234567890' },
]

contact_attributes.each do |attributes|
  contact = Contact.new(attributes)
  contact.save
end
