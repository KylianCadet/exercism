=begin
Write your code for the 'Parallel Letter Frequency' exercise in this file. Make
the tests in `parallel_letter_frequency_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/parallel_letter_frequency` directory.
=end

module ParallelLetterFrequency
  def self.count(texts)
    tally = Hash.new(0)
    texts.each do |text|
      text.each_grapheme_cluster do |cluster|
        tally[cluster] += 1
      end
    end

    tally
  end
end