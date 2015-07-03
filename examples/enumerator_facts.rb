my_enum = Enumerator.new { raise '💣' } # nothing happens

p my_enum.respond_to?(:each) # true
p my_enum.is_a?(Enumerable)  # true

# my_enum.each {}

# examples/facts.rb:6:in `block in <main>': 💣 (RuntimeError)
#   from examples/facts.rb:16:in `each'
#   from examples/facts.rb:16:in `each'
#   from examples/facts.rb:16:in `<main>'

my_enum = Enumerator.new do |e|
  e << 'hello!'
end

# my_enum = [].tap do |a|
#   a << 'hello!'
# end

my_enum.each do |item|
  p item
end

p my_enum.map(&:upcase).class      # Array
p my_enum.lazy.map(&:upcase).class # Enumerator::Lazy

