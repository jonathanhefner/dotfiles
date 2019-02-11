require "irb/completion"

IRB.conf[:PROMPT][:MY_PROMPT] = {
  :PROMPT_I => "\n>> ",
  :PROMPT_S => "%l%l  ",
  :PROMPT_C => "+> ",
  :PROMPT_N => "+> ",
  :RETURN => "## %s\n"
}

IRB.conf[:PROMPT_MODE] = :MY_PROMPT
