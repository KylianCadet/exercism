=begin
Write your code for the 'Parallel Letter Frequency' exercise in this file. Make
the tests in `parallel_letter_frequency_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/parallel_letter_frequency` directory.
=end

module ParallelLetterFrequency
  def self.count(texts)
    semaphore = Mutex.new
    tally = Hash.new(0)
    threads = texts.map{|text|
      Thread.new {
        text.downcase.each_grapheme_cluster{|cluster|
          next unless cluster =~ /[[:alpha:]]/
          semaphore.synchronize {
            tally[cluster] += 1
          }
        }
        tally
      }
    }
    threads.each &:join
    tally
  end
end