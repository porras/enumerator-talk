x = (1..9)

p x.map { |i| i * i } # [1, 4, 9, 16, ...]

p x.min # 1

p x.max # 9

p x.all? { |i| i < 5 } # false

p x.any?(&:odd?) # true

p x.detect { |i| i > 5 } # 6

p x.reduce(&:*) # 362880

p x.select(&:odd?) # [1, 3, 5, 7, 9]

p x.take_while { |i| i < 5 } # [1, 2, 3, 4]

p x.group_by { |i| i % 3 }
  # {0 => [3, 6, 9], 1 => [1, 4, 7], 2 => [2, 5, 8]}

x.each_slice(3) { |slice| p slice }
  # [1, 2, 3]
  # [4, 5, 6]
  # [7, 8, 9]

p x.each_slice(3).map { |slice| slice.first }
  # [1, 4, 7]

p x.partition(&:odd?)
  # [[1, 3, 5, 7, 9], [2, 4, 6, 8]]
