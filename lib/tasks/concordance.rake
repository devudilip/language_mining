desc "concordance for Poems"
task :update_concordance_for_poems => :environment do
  puts ">>>>>>>>>>>>>>Start >>>>>>>>>"
  Concord.new.run('poem', 'poem_text')
end



desc "Find unique keywords and counts, all over the poems"
task :update_keyword_count_in_poem_priority_1 => :environment do
  puts ">>>>>>>>>>>>>>Start >>>>>>>>>"
  i = 1
  Poem.find_each do |poem|
    puts i
    words = poem.poem_text.squish.split(/\ |\,|\.|\;|(\n)|\|/) if poem.poem_text
    puts "inside poem #{poem.id}"
    words.each do |word|
      puts word
      puts "words loop"
      keyword = KeyWord.find_by_word(word)
      if keyword
        puts "already keyword exists "
        unless keyword.poem_ids.keys.include?(poem.id)
          puts "keyword in this poem first time"
          count = words.count(word)
          total_count = keyword.count + count
          hash = keyword.poem_ids
          hash[poem.id] = count
          arraya = keyword.author_ids
          arraya << poem.author_id
          keyword.update_attributes(count: total_count, poem_ids: hash, author_ids: arraya)
        end
      else
        puts "new keyword"
        count = words.count(word)
        # count = vachana.vachana.scan(word).count
        hash = {poem.id => count}
        arraya = [poem.author_id]
        KeyWord.create(word: word , poem_ids: hash, count: count, author_ids: arraya)
      end
    end
    i += 1
  end
  puts ">>>>>>>>>>>finish >>>>>>>>>"
end

