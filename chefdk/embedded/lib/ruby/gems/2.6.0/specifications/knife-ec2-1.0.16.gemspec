# -*- encoding: utf-8 -*-
# stub: knife-ec2 1.0.16 ruby lib

Gem::Specification.new do |s|
  s.name = "knife-ec2".freeze
  s.version = "1.0.16"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef Software, Inc.".freeze]
  s.date = "2019-09-15"
  s.description = "Amazon EC2 Support for Chef's Knife Command".freeze
  s.email = ["info@chef.io".freeze]
  s.homepage = "https://github.com/chef/knife-ec2".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Amazon EC2 Support for Chef's Knife Command".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chef>.freeze, [">= 15.1"])
      s.add_runtime_dependency(%q<aws-sdk-s3>.freeze, ["~> 1.43"])
      s.add_runtime_dependency(%q<aws-sdk-ec2>.freeze, ["~> 1.95"])
    else
      s.add_dependency(%q<chef>.freeze, [">= 15.1"])
      s.add_dependency(%q<aws-sdk-s3>.freeze, ["~> 1.43"])
      s.add_dependency(%q<aws-sdk-ec2>.freeze, ["~> 1.95"])
    end
  else
    s.add_dependency(%q<chef>.freeze, [">= 15.1"])
    s.add_dependency(%q<aws-sdk-s3>.freeze, ["~> 1.43"])
    s.add_dependency(%q<aws-sdk-ec2>.freeze, ["~> 1.95"])
  end
end
