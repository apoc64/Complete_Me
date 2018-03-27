require_relative 'complete_me'
cm = CompleteMe.new
Shoes.app do
  # stack do
  #   flow do
  #     @input = edit_line :width => 400
  #   end


  stack(margin: 20) do
    para 'Enter a Substring'
    flow do
      @user_input = edit_line
      @clear_button = button 'clear'
      @user_input.change do
        @results.replace(cm.suggest(@user_input.text).join(', '))
      end
      @clear_button.click do
        @user_input.clear
      end
    end


    every 2 do
      @results = para ''
    end





    para 'Import'
    flow do
      @file_path = edit_line('/usr/share/dict/words')
      @import = button 'Import'
      @import.click do
        dictionary = File.read(@file_path.text)
        cm.populate(dictionary)
        @feedback.replace('Imported')
      end
    end
  end
end
