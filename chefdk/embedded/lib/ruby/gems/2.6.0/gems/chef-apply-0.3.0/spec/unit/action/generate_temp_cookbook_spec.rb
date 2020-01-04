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

require "chef_apply/action/generate_temp_cookbook"

RSpec.describe ChefApply::Action::GenerateTempCookbook do
  let(:options) { {} }
  subject { ChefApply::Action::GenerateTempCookbook }

  describe ".from_options" do
    context "when given options for a recipe" do
      let(:options) { { recipe_spec: "some::recipe" } }
      it "returns a GenerateCookbookFromRecipe action" do
        expect(subject.from_options(options)).to be_a(ChefApply::Action::GenerateCookbookFromRecipe)
      end
    end

    context "when given options for a resource" do
      let(:resource_properties) { {} }
      let(:options) do
        { resource_name: "user1", resource_type: "user",
          resource_properties: resource_properties } end

      it "returns a GenerateCookbookFromResource action" do
        expect(subject.from_options(options)).to be_a ChefApply::Action::GenerateCookbookFromResource
      end
    end

    context "when not given sufficient options for either" do
      let(:options) { {} }
      it "raises MissingOptions" do
        expect { subject.from_options(options) }.to raise_error ChefApply::Action::MissingOptions
      end
    end

  end

  describe "#perform_action" do
    subject { ChefApply::Action::GenerateTempCookbook.new( {} ) }
    it "generates a cookbook, notifies caller, and makes the cookbook available" do

      expect(subject).to receive(:notify).ordered.with(:generating)
      expect(subject).to receive(:generate)
      expect(subject).to receive(:notify).ordered.with(:success)
      subject.perform_action
      expect(subject.generated_cookbook).to_not be nil
    end

  end

end

RSpec.describe ChefApply::Action::GenerateCookbookFromRecipe do
  describe "#generate" do
  end
end

RSpec.describe ChefApply::Action::GenerateCookbookFromResource do
  describe "#generate" do
  end
end
