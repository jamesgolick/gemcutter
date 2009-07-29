class Gem::Commands::TumbleCommand < Gem::Command
  def description
    'Enable or disable Gemcutter as your primary gem source.'
  end

  def initialize
    super 'tumble', description
  end

  def execute
    say "Thanks for using Gemcutter!"
    tumble
    show_sources
  end

  def tumble
    if Gem.sources.include?(URL)
      Gem.sources.delete URL
      Gem.configuration.write
    else
      Gem.sources.unshift URL
      Gem.configuration.write
    end
  end

  def show_sources
    puts "Your gem sources are now:"
    Gem.sources.each do |source|
      puts "- #{source}"
    end
  end
end