require 'csv'


desc "Import authors from csv"
task :import_authors_from_csv => :environment do
  file_name = Rails.root.to_s+"/lib/daasa.csv"
  puts "started"
  CSV.foreach(file_name, :col_sep => ",", :headers => true) do |row|
    Author.create(original_id: row[0], name: row[1], information: row[2])
    puts ">>>>>>>>>>>>>.."
  end
  puts "End "
end


desc "Import authors from csv"
task :import_poems_from_csv => :environment do
  file_name = Rails.root.to_s+"/lib/keerthane.csv"
  puts "started"
  CSV.foreach(file_name, :col_sep => ",", :headers => true) do |row|
    Poem.create(poem_text: row[1], author_id: row[2], original_id: row[4], book_id: 1)
    puts ">>>>>>>>>>>>>.."
  end
  puts "End "
end