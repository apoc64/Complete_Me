require_relative "complete_me"

cm = CompleteMe.new
dictionary = File.read("/usr/share/dict/words")

puts dictionary.split("\n").count

start_time = Time.new
cm.populate(dictionary)
populate_time = Time.new - start_time
puts "Populate Time: #{populate_time} seconds"

puts cm.root.get_end_nodes.count

suggest_time = Time.new
words = cm.suggest("piz")
suggest_time = Time.new - suggest_time
# puts words
puts "Piz Suggest Time: #{suggest_time} seconds"

suggest_time = Time.new
words = cm.suggest("zebr")
suggest_time = Time.new - suggest_time
# puts words
puts "Zebr Suggest Time: #{suggest_time} seconds"

suggest_time = Time.new
words = cm.suggest("xqpv")
suggest_time = Time.new - suggest_time
# puts words
puts "Zqpv Suggest Time: #{suggest_time} seconds"

mid_string_suggest_time = Time.new
words = cm.mid_string_suggest("attl")
mid_string_suggest_time = Time.new - mid_string_suggest_time
puts "attl Mid String Suggest Time: #{mid_string_suggest_time} seconds"

mid_string_suggest_time = Time.new
words = cm.mid_string_suggest("ohe")
mid_string_suggest_time = Time.new - mid_string_suggest_time
puts "ohe Mid String Suggest Time: #{mid_string_suggest_time} seconds"

mid_string_suggest_time = Time.new
words = cm.mid_string_suggest("tool")
mid_string_suggest_time = Time.new - mid_string_suggest_time
puts "tool Mid String Suggest Time: #{mid_string_suggest_time} seconds"
