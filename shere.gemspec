# -*- encoding: utf-8 -*-
# stub: shere 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "shere".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lin Jen-Shin (godfat)".freeze]
  s.date = "2018-03-14"
  s.description = "_Share_ the directory _here_ with [Nginx][]!\nShere would create a temporary Nginx config and run an\nNginx instance to serve the directory you specified.".freeze
  s.email = ["godfat (XD) godfat.org".freeze]
  s.executables = ["shere".freeze]
  s.files = [
  ".gitignore".freeze,
  ".gitmodules".freeze,
  "CHANGES.md".freeze,
  "Gemfile".freeze,
  "LICENSE".freeze,
  "README.md".freeze,
  "Rakefile".freeze,
  "TODO.md".freeze,
  "bin/shere".freeze,
  "lib/shere.rb".freeze,
  "lib/shere/runner.rb".freeze,
  "lib/shere/version.rb".freeze,
  "shere.gemspec".freeze,
  "task/README.md".freeze,
  "task/gemgem.rb".freeze]
  s.homepage = "https://github.com/godfat/shere".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "_Share_ the directory _here_ with [Nginx][]!".freeze
end
