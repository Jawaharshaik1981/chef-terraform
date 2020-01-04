# -*- encoding: utf-8 -*-
# stub: chef 15.4.45 ruby lib

Gem::Specification.new do |s|
  s.name = "chef".freeze
  s.version = "15.4.45"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Adam Jacob".freeze]
  s.date = "2019-10-15"
  s.description = "A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.".freeze
  s.email = "adam@chef.io".freeze
  s.executables = ["knife".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "bin/knife".freeze]
  s.homepage = "https://www.chef.io".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chef-config>.freeze, ["= 15.4.45"])
      s.add_runtime_dependency(%q<train-core>.freeze, ["~> 3.1"])
      s.add_runtime_dependency(%q<train-winrm>.freeze, [">= 0.2.5"])
      s.add_runtime_dependency(%q<license-acceptance>.freeze, ["~> 1.0", ">= 1.0.5"])
      s.add_runtime_dependency(%q<mixlib-cli>.freeze, [">= 2.1.1", "< 3.0"])
      s.add_runtime_dependency(%q<mixlib-log>.freeze, [">= 2.0.3", "< 4.0"])
      s.add_runtime_dependency(%q<mixlib-authentication>.freeze, ["~> 2.1"])
      s.add_runtime_dependency(%q<mixlib-shellout>.freeze, [">= 3.0.3", "< 4.0"])
      s.add_runtime_dependency(%q<mixlib-archive>.freeze, [">= 0.4", "< 2.0"])
      s.add_runtime_dependency(%q<ohai>.freeze, ["~> 15.0"])
      s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.9", ">= 1.9.25"])
      s.add_runtime_dependency(%q<ffi-yajl>.freeze, ["~> 2.2"])
      s.add_runtime_dependency(%q<net-ssh>.freeze, [">= 4.2", "< 6"])
      s.add_runtime_dependency(%q<net-ssh-multi>.freeze, ["~> 1.2", ">= 1.2.1"])
      s.add_runtime_dependency(%q<net-sftp>.freeze, ["~> 2.1", ">= 2.1.2"])
      s.add_runtime_dependency(%q<ed25519>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<bcrypt_pbkdf>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<highline>.freeze, [">= 1.6.9", "< 2"])
      s.add_runtime_dependency(%q<tty-screen>.freeze, ["~> 0.6"])
      s.add_runtime_dependency(%q<erubis>.freeze, ["~> 2.7"])
      s.add_runtime_dependency(%q<diff-lcs>.freeze, ["~> 1.2", ">= 1.2.4"])
      s.add_runtime_dependency(%q<ffi-libarchive>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<chef-zero>.freeze, [">= 14.0.11"])
      s.add_runtime_dependency(%q<plist>.freeze, ["~> 3.2"])
      s.add_runtime_dependency(%q<iniparse>.freeze, ["~> 1.4"])
      s.add_runtime_dependency(%q<addressable>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<syslog-logger>.freeze, ["~> 1.6"])
      s.add_runtime_dependency(%q<uuidtools>.freeze, ["~> 2.1.5"])
      s.add_runtime_dependency(%q<proxifier>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<bundler>.freeze, [">= 1.10"])
    else
      s.add_dependency(%q<chef-config>.freeze, ["= 15.4.45"])
      s.add_dependency(%q<train-core>.freeze, ["~> 3.1"])
      s.add_dependency(%q<train-winrm>.freeze, [">= 0.2.5"])
      s.add_dependency(%q<license-acceptance>.freeze, ["~> 1.0", ">= 1.0.5"])
      s.add_dependency(%q<mixlib-cli>.freeze, [">= 2.1.1", "< 3.0"])
      s.add_dependency(%q<mixlib-log>.freeze, [">= 2.0.3", "< 4.0"])
      s.add_dependency(%q<mixlib-authentication>.freeze, ["~> 2.1"])
      s.add_dependency(%q<mixlib-shellout>.freeze, [">= 3.0.3", "< 4.0"])
      s.add_dependency(%q<mixlib-archive>.freeze, [">= 0.4", "< 2.0"])
      s.add_dependency(%q<ohai>.freeze, ["~> 15.0"])
      s.add_dependency(%q<ffi>.freeze, ["~> 1.9", ">= 1.9.25"])
      s.add_dependency(%q<ffi-yajl>.freeze, ["~> 2.2"])
      s.add_dependency(%q<net-ssh>.freeze, [">= 4.2", "< 6"])
      s.add_dependency(%q<net-ssh-multi>.freeze, ["~> 1.2", ">= 1.2.1"])
      s.add_dependency(%q<net-sftp>.freeze, ["~> 2.1", ">= 2.1.2"])
      s.add_dependency(%q<ed25519>.freeze, ["~> 1.2"])
      s.add_dependency(%q<bcrypt_pbkdf>.freeze, ["~> 1.0"])
      s.add_dependency(%q<highline>.freeze, [">= 1.6.9", "< 2"])
      s.add_dependency(%q<tty-screen>.freeze, ["~> 0.6"])
      s.add_dependency(%q<erubis>.freeze, ["~> 2.7"])
      s.add_dependency(%q<diff-lcs>.freeze, ["~> 1.2", ">= 1.2.4"])
      s.add_dependency(%q<ffi-libarchive>.freeze, [">= 0"])
      s.add_dependency(%q<chef-zero>.freeze, [">= 14.0.11"])
      s.add_dependency(%q<plist>.freeze, ["~> 3.2"])
      s.add_dependency(%q<iniparse>.freeze, ["~> 1.4"])
      s.add_dependency(%q<addressable>.freeze, [">= 0"])
      s.add_dependency(%q<syslog-logger>.freeze, ["~> 1.6"])
      s.add_dependency(%q<uuidtools>.freeze, ["~> 2.1.5"])
      s.add_dependency(%q<proxifier>.freeze, ["~> 1.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.10"])
    end
  else
    s.add_dependency(%q<chef-config>.freeze, ["= 15.4.45"])
    s.add_dependency(%q<train-core>.freeze, ["~> 3.1"])
    s.add_dependency(%q<train-winrm>.freeze, [">= 0.2.5"])
    s.add_dependency(%q<license-acceptance>.freeze, ["~> 1.0", ">= 1.0.5"])
    s.add_dependency(%q<mixlib-cli>.freeze, [">= 2.1.1", "< 3.0"])
    s.add_dependency(%q<mixlib-log>.freeze, [">= 2.0.3", "< 4.0"])
    s.add_dependency(%q<mixlib-authentication>.freeze, ["~> 2.1"])
    s.add_dependency(%q<mixlib-shellout>.freeze, [">= 3.0.3", "< 4.0"])
    s.add_dependency(%q<mixlib-archive>.freeze, [">= 0.4", "< 2.0"])
    s.add_dependency(%q<ohai>.freeze, ["~> 15.0"])
    s.add_dependency(%q<ffi>.freeze, ["~> 1.9", ">= 1.9.25"])
    s.add_dependency(%q<ffi-yajl>.freeze, ["~> 2.2"])
    s.add_dependency(%q<net-ssh>.freeze, [">= 4.2", "< 6"])
    s.add_dependency(%q<net-ssh-multi>.freeze, ["~> 1.2", ">= 1.2.1"])
    s.add_dependency(%q<net-sftp>.freeze, ["~> 2.1", ">= 2.1.2"])
    s.add_dependency(%q<ed25519>.freeze, ["~> 1.2"])
    s.add_dependency(%q<bcrypt_pbkdf>.freeze, ["~> 1.0"])
    s.add_dependency(%q<highline>.freeze, [">= 1.6.9", "< 2"])
    s.add_dependency(%q<tty-screen>.freeze, ["~> 0.6"])
    s.add_dependency(%q<erubis>.freeze, ["~> 2.7"])
    s.add_dependency(%q<diff-lcs>.freeze, ["~> 1.2", ">= 1.2.4"])
    s.add_dependency(%q<ffi-libarchive>.freeze, [">= 0"])
    s.add_dependency(%q<chef-zero>.freeze, [">= 14.0.11"])
    s.add_dependency(%q<plist>.freeze, ["~> 3.2"])
    s.add_dependency(%q<iniparse>.freeze, ["~> 1.4"])
    s.add_dependency(%q<addressable>.freeze, [">= 0"])
    s.add_dependency(%q<syslog-logger>.freeze, ["~> 1.6"])
    s.add_dependency(%q<uuidtools>.freeze, ["~> 2.1.5"])
    s.add_dependency(%q<proxifier>.freeze, ["~> 1.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.10"])
  end
end
