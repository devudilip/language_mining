desc "concordance for Poems"
task :update_concordance_for_poems_4 => :environment do
  puts ">>>>>>>>>>>>>>Start >>>>>>>>>"
  Concord.new.run('poem', 'poem_text')
end

desc "concordance for Keyword"
task :update_concordance_for_key_words_5 => :environment do
  puts ">>>>>>>>>>>>>>Start >>>>>>>>>"
  Concord.new.run('key_word', 'word')
end


