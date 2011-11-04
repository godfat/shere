# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "shere"
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lin Jen-Shin (godfat)"]
  s.date = "2011-11-04"
  s.description = "_Share_ the directory _here_ with [Nginx][]!\n\n[Nginx]: http://nginx.org/"
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
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "_Share_ the directory _here_ with [Nginx][]!"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
