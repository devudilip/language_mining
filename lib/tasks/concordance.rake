desc "concordance for Poems"
task :update_concordance_for_poems => :environment do
  puts ">>>>>>>>>>>>>>Start >>>>>>>>>"
  Concord.new.run('poem', 'poem_text')
end