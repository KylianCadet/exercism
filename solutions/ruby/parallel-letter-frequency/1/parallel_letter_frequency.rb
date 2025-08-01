=begin
Write your code for the 'Parallel Letter Frequency' exercise in this file. Make
the tests in `parallel_letter_frequency_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/parallel_letter_frequency` directory.
=end

module ParallelLetterFrequency
  def self.count(texts)
    threads = texts.map{|text|
      Thread.new {
        tally = Hash.new(0)
        text.downcase.each_grapheme_cluster{|cluster|
          next unless cluster =~ /[[:alpha:]]/
          tally[cluster] += 1
        }
        tally
      }
    }
    threads.each { |thr| thr.join }
    tallies = threads.map { |thr| thr.value }
    tallies.inject({}) {|acc, tally|
      tally.each{|k, v|
      if acc[k].nil?
        acc[k] = v 
      else
        acc[k] += v
      end
      }
      acc
    }
  end
end