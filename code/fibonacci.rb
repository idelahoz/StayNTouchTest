class Fibonacci
  # Implement a method that will calculate the Nth number of the Fibonacci
  # sequence (http://en.wikipedia.org/wiki/Fibonacci_number)
  def self.calculate(n)
    return 0 if n == 0
    (1...n).inject( [0, 1] ) { | sequence | sequence << sequence.last(2).sum }.last
  end
end