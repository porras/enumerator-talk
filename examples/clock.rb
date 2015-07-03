class Clock
  def self.seconds
    Enumerator.new do |e|
      loop do
        e << Time.now.to_i
        sleep 1
      end
    end.lazy
  end

  def self.minutes
    seconds.select { |t| t % 60 == 0 }
  end
end

Clock.seconds.select(&:odd?).take(5).each do |time|
  p time
end

# 1435648191
# 1435648193
# 1435648195
# 1435648197
# 1435648199
