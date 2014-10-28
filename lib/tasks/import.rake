require 'csv'


desc "Import authors from csv"
task :import_authors_from_csv => :environment do
  file_name = Rails.root.to_s+"/lib/daasa.csv"
  puts "started"
  CSV.foreach(file_name, :col_sep => ",", :headers => true) do |row|
    # Glossary.create(word: row[0], meanings: row[1])
    puts row[0]
    puts row[1]
    puts row[2]
    puts ">>>>>>>>>>>>>.."
  end
  puts "End "
end
