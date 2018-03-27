require_relative 'complete_me'
cm = CompleteMe.new

Shoes.app do
  stack do
    edit_box.change do |user_input|
      input = user_input.split(" ")
      @input_word = input[-1]
      para = cm.suggest(@input_word)
    end
  end 
  #   list_box items: ['/usr/share/dict/words'],
  #     choose: '/usr/share/dict/words' do
  #       @dictionary = File.read(@file_path.text)
  #       cm.populate(@dictionary)
  #     end
  #   end
  # end
end
