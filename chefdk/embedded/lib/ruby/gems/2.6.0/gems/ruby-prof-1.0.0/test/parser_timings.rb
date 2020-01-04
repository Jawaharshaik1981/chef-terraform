require File.expand_path('../test_helper', __FILE__)

require 'ruby-prof'

require 'parser/current'
Parser::Builders::Default.emit_lambda   = true
Parser::Builders::Default.emit_procarg0 = true
Parser::Builders::Default.emit_encoding = true
Parser::Builders::Default.emit_index    = true

start = Time.now
result = RubyProf.profile(:measure_mode => RubyProf::ALLOCATIONS, :track_allocations => true) do
  code = File.read('C:/msys64/usr/local/src/ruby-2.6.3/lib/rdoc/markdown.rb')
  parse = Parser::CurrentRuby.parse(code)
end

finish = Time.now

puts "#{finish - start} seconds"

printer = RubyProf::GraphHtmlPrinter.new(result)
File.open('c:/temp/graph.html', 'wb') do |file|
  printer.print(file)
end
