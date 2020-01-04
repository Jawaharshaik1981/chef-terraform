# frozen_string_literal: true

require_relative "../lib/tty-prompt"

prompt = TTY::Prompt.new

answer = prompt.ask('Password?', echo: false) do |q|
  q.validate(/^[^\.]+\.[^\.]+/)
end

puts "Password: #{answer}"
