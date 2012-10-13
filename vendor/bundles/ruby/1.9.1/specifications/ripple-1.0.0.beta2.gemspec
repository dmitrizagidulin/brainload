# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ripple"
  s.version = "1.0.0.beta2"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sean Cribbs"]
  s.date = "2012-06-07"
  s.description = "ripple is an object-mapper library for Riak, the distributed database by Basho.  It uses ActiveModel to provide an experience that integrates well with Rails 3 applications."
  s.email = ["sean@basho.com"]
  s.homepage = "http://seancribbs.github.com/ripple"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "ripple is an object-mapper library for Riak, the distributed database by Basho."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<ammeter>, ["~> 0.2.2"])
      s.add_runtime_dependency(%q<riak-client>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<activesupport>, ["< 3.3.0", ">= 3.0.0"])
      s.add_runtime_dependency(%q<activemodel>, ["< 3.3.0", ">= 3.0.0"])
      s.add_runtime_dependency(%q<tzinfo>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<ammeter>, ["~> 0.2.2"])
      s.add_dependency(%q<riak-client>, ["~> 1.0.0"])
      s.add_dependency(%q<activesupport>, ["< 3.3.0", ">= 3.0.0"])
      s.add_dependency(%q<activemodel>, ["< 3.3.0", ">= 3.0.0"])
      s.add_dependency(%q<tzinfo>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<ammeter>, ["~> 0.2.2"])
    s.add_dependency(%q<riak-client>, ["~> 1.0.0"])
    s.add_dependency(%q<activesupport>, ["< 3.3.0", ">= 3.0.0"])
    s.add_dependency(%q<activemodel>, ["< 3.3.0", ">= 3.0.0"])
    s.add_dependency(%q<tzinfo>, [">= 0"])
  end
end
