#
# Copyright:: Copyright (c) 2018 Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "spec_helper"
require "chef_apply/log"

RSpec.describe ChefApply::Log do
  Log = ChefApply::Log
  let(:output) { StringIO.new }

  before do
    Log.setup output, :debug
  end

  after do
    Log.setup "/dev/null", :error
  end

  it "correctly logs to stdout" do
    Log.debug("test")
    expect(output.string).to match(/DEBUG: test$/)
  end
end
