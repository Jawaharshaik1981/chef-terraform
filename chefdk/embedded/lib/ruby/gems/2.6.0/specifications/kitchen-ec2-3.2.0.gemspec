# -*- encoding: utf-8 -*-
# stub: kitchen-ec2 3.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "kitchen-ec2".freeze
  s.version = "3.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Fletcher Nichol".freeze]
  s.date = "2019-09-17"
  s.description = "A Test Kitchen Driver for Amazon EC2".freeze
  s.email = ["fnichol@nichol.ca".freeze]
  s.homepage = "https://github.com/test-kitchen/kitchen-ec2".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A Test Kitchen Driver for Amazon EC2".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<test-kitchen>.freeze, [">= 1.4.1", "< 3"])
      s.add_runtime_dependency(%q<excon>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<aws-sdk-ec2>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<retryable>.freeze, [">= 2.0", "< 4.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_development_dependency(%q<countloc>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<maruku>.freeze, ["~> 0.6"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.7"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0.9.11"])
      s.add_development_dependency(%q<chefstyle>.freeze, ["= 0.13.3"])
      s.add_development_dependency(%q<climate_control>.freeze, [">= 0"])
    else
      s.add_dependency(%q<test-kitchen>.freeze, [">= 1.4.1", "< 3"])
      s.add_dependency(%q<excon>.freeze, [">= 0"])
      s.add_dependency(%q<multi_json>.freeze, [">= 0"])
      s.add_dependency(%q<aws-sdk-ec2>.freeze, ["~> 1.0"])
      s.add_dependency(%q<retryable>.freeze, [">= 2.0", "< 4.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_dependency(%q<countloc>.freeze, ["~> 0.4"])
      s.add_dependency(%q<maruku>.freeze, ["~> 0.6"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.7"])
      s.add_dependency(%q<yard>.freeze, [">= 0.9.11"])
      s.add_dependency(%q<chefstyle>.freeze, ["= 0.13.3"])
      s.add_dependency(%q<climate_control>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<test-kitchen>.freeze, [">= 1.4.1", "< 3"])
    s.add_dependency(%q<excon>.freeze, [">= 0"])
    s.add_dependency(%q<multi_json>.freeze, [">= 0"])
    s.add_dependency(%q<aws-sdk-ec2>.freeze, ["~> 1.0"])
    s.add_dependency(%q<retryable>.freeze, [">= 2.0", "< 4.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_dependency(%q<countloc>.freeze, ["~> 0.4"])
    s.add_dependency(%q<maruku>.freeze, ["~> 0.6"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.7"])
    s.add_dependency(%q<yard>.freeze, [">= 0.9.11"])
    s.add_dependency(%q<chefstyle>.freeze, ["= 0.13.3"])
    s.add_dependency(%q<climate_control>.freeze, [">= 0"])
  end
end
