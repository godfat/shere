# -*- encoding: utf-8 -*-
# stub: shere 0.9.2 ruby lib

Gem::Specification.new do |s|
  s.name = "shere"
  s.version = "0.9.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lin Jen-Shin (godfat)"]
  s.date = "2013-09-29"
  s.description = "_Share_ the directory _here_ with [Nginx][]!\nShere would create a temporary Nginx config and run an\nNginx instance to serve the directory you specified."
  s.email = ["godfat (XD) godfat.org"]
  s.executables = ["shere"]
  s.files = [
  ".gitignore",
  ".gitmodules",
  "CHANGES.md",
  "Gemfile",
  "LICENSE",
  "README.md",
  "Rakefile",
  "TODO.md",
  "bin/shere",
  "lib/shere.rb",
  "lib/shere/runner.rb",
  "lib/shere/version.rb",
  "shere.gemspec",
  "task/.gitignore",
  "task/gemgem.rb"]
  s.homepage = "https://github.com/godfat/shere"
  s.licenses = ["Apache License 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.5"
  s.summary = "_Share_ the directory _here_ with [Nginx][]!"
end
