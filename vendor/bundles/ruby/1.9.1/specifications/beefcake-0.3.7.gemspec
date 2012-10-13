# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "beefcake"
  s.version = "0.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Blake Mizerany"]
  s.date = "2011-09-29"
  s.description = "A sane protobuf library for Ruby"
  s.email = ["blake.mizerany@gmail.com"]
  s.executables = ["protoc-gen-beefcake"]
  s.files = ["bin/protoc-gen-beefcake"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubyforge_project = "beefcake"
  s.rubygems_version = "1.8.24"
  s.summary = "A sane protobuf library for Ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
