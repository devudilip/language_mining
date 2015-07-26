require 'csv'


desc "import kagga from csv"
task :import_kagga_from_csv => :environment do
  file_name = Rails.root.to_s + "/lib/kagga_main.csv"
  puts "started"
  @author = Author.create(name: 'ಡಾ. ಡಿ.ವಿ.ಗುಂಡಪ್ಪ')
  CSV.foreach(file_name, :col_sep => ",", :headers => false) do |row|
    Poem.create(poem_text: row[1], author_id: @author.id)
    p ">>>>>>>>>>>>>>>>>>>>>"
  end
end

desc "Import authors from csv"
task :import_authors_from_csv_1 => :environment do
  file_name = Rails.root.to_s+"/lib/daasa.csv"
  puts "started"
  CSV.foreach(file_name, :col_sep => ",", :headers => true) do |row|
    Author.create(original_id: row['did'], name: row['name'], information: row['profile'])
    puts ">>>>>>>>>>>>>.."
  end
  puts "End "
end


desc "Import authors from csv"
task :import_poems_from_csv_2 => :environment do
  file_name = Rails.root.to_s+"/lib/keerthane.csv"
  puts "started"
  CSV.foreach(file_name, :col_sep => ",", :headers => true) do |row|
    author = Author.find_by(original_id: row['did'])
    begin
      if author
        Poem.create(poem_text: row['keerthane'], author_id: author.id, original_id: row['web_id'])
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

desc "create unique words out of poem"
task :create_uniq_words_3 => :environment do
  puts "started creating"
  Poem.new.run('poem_text')
end