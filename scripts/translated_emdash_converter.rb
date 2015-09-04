#!/usr/bin/env ruby

REPLACE_WITH = " &ndash "

is_translation = false

lines = ARGF.readlines
lines.each_with_index do |line, i|
  case line
  when /^msgid/ then is_translation = false
  when /^msgstr/ then is_translation = true
  end

  unless is_translation
    next
  end

  if line =~ /^"&mdash;/
    lines[i-1].sub!(/ *"$/, "\"")
  end
  if line =~ /&mdash;"$/
    lines[i+1].sub!(/^" */, "\"")
  end

  line.gsub!(/ *&mdash; */, REPLACE_WITH)
end
puts lines
