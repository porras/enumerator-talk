class Fibonacci
  def self.pairs
    Pairs.new.lazy
  end

  class Pairs
    include Enumerable

    def each
      pair = [0, 1]
      loop do
        yield pair
        pair = [pair.last, pair.first + pair.last]
      end
    end
  end

  def self.numbers
    pairs.map(&:first)
  end
end

p Fibonacci.numbers.drop_while { |i| i < 1000 }.take(10).to_a
  # [1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393]

p Fibonacci.numbers.select { |i| i % 5 == 0 }.
  take_while { |i| i < 10 ** 6 }.to_a
  # [0, 5, 55, 610, 6765, 75025, 832040]
