module Grep
  FLAGS = {
    '-n' => :prepend,
    '-l' => :only_name,
    '-i' => :case_insensitive,
    '-v' => :invert,
    '-x' => :entire_line
  }.freeze

  def self.grep(pattern, flags, files)
    grep_lines = []

    FLAGS.each{|flag, label|
      define_singleton_method("#{label.to_s}_flag?") {
        flags.include? flag
      }
    }

    files.each{|file|
      content = File.read(file)
      content.lines.each.with_index {|line, index|
        regexp = /#{pattern}/
        regexp = /^#{pattern}$/ if entire_line_flag?
        regexp = /#{pattern}/i if case_insensitive_flag?
        regexp = /^#{pattern}$/i if case_insensitive_flag? && entire_line_flag?

        next if line.match(regexp).nil? && !invert_flag?
        next if !line.match(regexp).nil? && invert_flag?
        
        if only_name_flag?
          next if grep_lines.include? file
          next grep_lines << file
        end

        line = "#{index + 1}:#{line}" if prepend_flag?
        line = "#{file}:#{line}" if files.length > 1
        grep_lines << line
      }
    }

    grep_lines.join("\n").gsub(/\s$/, '')
  end
end