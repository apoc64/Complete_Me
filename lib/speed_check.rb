require_relative "complete_me"

cm = CompleteMe.new
dictionary = File.read("/usr/share/dict/words")

start_time = Time.new
cm.populate(dictionary)
populate_time = Time.new - start_time
puts "Populate Time: #{populate_time} seconds"

suggest_time = Time.new
words = cm.suggest("piz")
suggest_time = Time.new - suggest_time
puts words
puts "Piz Suggest Time: #{suggest_time} seconds"

suggest_time = Time.new
words = cm.suggest("zebr")
suggest_time = Time.new - suggest_time
puts words
puts "Zebr Suggest Time: #{suggest_time} seconds"

suggest_time = Time.new
words = cm.suggest("xqpv")
suggest_time = Time.new - suggest_time
puts words
puts "Xqpv Suggest Time: #{suggest_time} seconds"
