require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    @client = JumpstartAuth.twitter
  end

  def tweet(msg)
    if msg.length <= 140
      @client.update msg
      print 'Success'
    else
      print 'Too long'
    end
  end

  def last_tweets
    friends = @client.friends.sort_by { |friend| @client.user(friend).screen_name }
    friends.each do |friend|
      print "#{@client.user(friend).screen_name}:"
      puts @client.user(friend).status.created_at.strftime(' %A, %b %d')
      puts @client.user(friend).status.text, ''
    end
  end

  def run
    puts 'This is an experimental twitter client.'
    puts "enter 't' with argument for tweet, 'l' to map last tweets per friend, 'q' to exit."
    command = gets.chomp
    parsed_command = command.split(' ')
    command = parsed_command.first
    case command
    when 'q' then puts 'Cya.'
    when 't' then tweet(parsed_command.drop(1).join(' '))
    when 'l' then last_tweets
    else
      puts 'wat'
      run
    end
  end
end

blogger = MicroBlogger.new
blogger.run
