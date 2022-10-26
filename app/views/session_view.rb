class SessionView
  def ask_for(stuff)
    puts "#{stuff.capitalize}"
    print ">"
    gets.chomp
  end

  def login_sucessful
    puts "Login sucessful. Welcome!"
  end

  def wrong_credentials
    puts "wrong credentials...try again."
  end
end
