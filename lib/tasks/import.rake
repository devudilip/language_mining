require 'csv'


desc "Import authors from csv"
task :import_authors_from_csv => :environment do
  file_name = Rails.root.to_s+"/lib/daasa.csv"
  puts "started"
  CSV.foreach(file_name, :col_sep => ",", :headers => true) do |row|
    Author.create(original_id: row['original_id'], name: row['name'], information: row['information'])
    puts ">>>>>>>>>>>>>.."
  end
  puts "End "
end


desc "Import authors from csv"
task :import_poems_from_csv => :environment do
  file_name = Rails.root.to_s+"/lib/keerthane.csv"
  puts "started"
  CSV.foreach(file_name, :col_sep => ",", :headers => true) do |row|
    author = Author.find_by(original_id: row['author_id'])
    begin
      if author
        Poem.create(poem_text: row['poem_text'], author_id: author.id, original_id: row['original_id'])
      else
        p row['author_id']
      end
      puts ">>>>>>>>>>>>>.."
    rescue
      p "Errorrrrrrrrrrrrd"
      p author
    end
  end
  puts "End "
end