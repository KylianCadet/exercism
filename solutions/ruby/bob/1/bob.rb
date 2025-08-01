module Bob
  RESPONSE_TO_QUESTION = 'Sure.'
  RESPONSE_TO_YELL = 'Whoa, chill out!'
  RESPONSE_TO_YELLED_QUESTION = 'Calm down, I know what I\'m doing!'
  RESPONSE_TO_SILENT = 'Fine. Be that way!'
  DEFAULT_RESPONSE = 'Whatever.'


  def self.hey(remark)
    has_letter = remark =~ /[A-Za-z]/
    is_question = remark =~ /\?[\s]*\z/
    is_all_captial = remark =~ /^[A-Z\W\d]+\z/
    is_silent = remark =~ /^\s*\z/

    if is_silent
      RESPONSE_TO_SILENT
    elsif is_question and is_all_captial and has_letter
      RESPONSE_TO_YELLED_QUESTION
    elsif is_question
      RESPONSE_TO_QUESTION
    elsif is_all_captial and has_letter
      RESPONSE_TO_YELL
    else
      DEFAULT_RESPONSE
    end
  end
end