#
# Author:: Steven Danna (<steve@chef.io>)
# Copyright:: Copyright 2012-2018, Chef Software Inc.
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

require_relative "../knife"

class Chef
  class Knife
    class UserEdit < Knife

      deps do
        require_relative "../user_v1"
      end

      banner "knife user edit USER (options)"

      def run
        @user_name = @name_args[0]

        if @user_name.nil?
          show_usage
          ui.fatal("You must specify a user name")
          exit 1
        end

        original_user = Chef::UserV1.load(@user_name).to_hash
        edited_user = edit_hash(original_user)
        if original_user != edited_user
          user = Chef::UserV1.from_hash(edited_user)
          user.update
          ui.msg("Saved #{user}.")
        else
          ui.msg("User unchanged, not saving.")
        end
      end
    end
  end
end
