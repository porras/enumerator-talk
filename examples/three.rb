class Three
  include Enumerable

  def each
    yield 1
    yield 2
    yield 3
  end
end

three = Three.new

# three = [1, 2, 3]

  three.each { |i| puts i }
p three.map { |i| i * i }
p three.select(&:odd?)
p three.max
p three.first
p three.reduce(&:+)
