require_relative 'complete_me'
cm = CompleteMe.new
Shoes.app do
  stack(margin: 20) do
    para 'Enter a Substring'
    flow do
      @user_input = edit_line
      @clear_button = button 'clear'
      @select_button = button 'Select Word'
      @user_input.change do
        @results.replace(cm.suggest(@user_input.text)[0..9].join(', '))
      end
      @clear_button.click do
        @results.replace ""
        @user_input.text = ""
        hide(@choices)
      end
    end

    @results = para ''

    para 'Import (This may take a few seconds)'
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
