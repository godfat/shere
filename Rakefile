
begin
  require "#{__dir__}/task/gemgem"
rescue LoadError
  sh 'git submodule update --init --recursive'
  exec Gem.ruby, '-S', $PROGRAM_NAME, *ARGV
end

Gemgem.init(__dir__) do |s|
  require 'shere/version'
  s.name    = 'shere'
  s.version = Shere::VERSION
end
