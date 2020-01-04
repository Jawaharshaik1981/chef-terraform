# gcewinpass - Reset GCE Windows Instance Passwords

The process for resetting a Windows instance password on Google Compute Engine is a bit involved. This gem provides a tool for automating the resetting of those passwords.

It was originally developed for use by Chef in the [knife-google](https://github.com/chef/knife-google) and [kitchen-google](https://github.com/test-kitchen/kitchen-google) plugins.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gcewinpass'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gcewinpass

## Usage

First, create a Google Cloud credentials file. The easiest way to do this is to install the [Google Cloud SDK](https://cloud.google.com/sdk/) and run `gcloud auth login`. Alternatively, set a `GOOGLE_APPLICATION_CREDENTIALS` environment variable pointing to your credentials JSON file.

Then, in your application, create a GoogleComputeWindowsPassword object and retrieve a new password:

```ruby
password_reset = GoogleComputeWindowsPassword.new(
  project:       "my-gce-project",
  zone:          "us-east1-c",
  instance_name: "windows-instance-1",
  email:         "myemail@company.com"
)
password_reset.new_password
```

The return from `new_password` will be the new password set on the Windows instance.

The following parameters are required:

 - **project**: short-name of the Google Cloud project hosting the instance
 - **zone**: the name of the zone hosting the instance
 - **instance_name**: the name of the instance on which you wish to reset a password
 - **email**: the email address of the logged-in Google Cloud user

The following parameters are optional:

 - **username**: the account user name on the instance for which to reset the password. Defaults to "Administrator"
 - **timeout**: number of seconds to wait for any API interaction. Defaults to 60.
 - **debug**: when set to true, some helpful debugging messages will be output to STDERR. Defaults to false.


## License and Authors

Author:: Chef Partner Engineering (<partnereng@chef.io>)

Copyright:: Copyright (c) 2016 Chef Software, Inc.

License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the License at

```
http://www.apache.org/licenses/LICENSE-2.0
```

Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.

## Contributing

We'd love to hear from you if you find this isn't working for you. Please submit a GitHub issue with any problems you encounter.

Additionally, contributions are welcome!  If you'd like to send up any fixes or changes:

1. Fork it ( https://github.com/chef-partners/gcewinpass/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
