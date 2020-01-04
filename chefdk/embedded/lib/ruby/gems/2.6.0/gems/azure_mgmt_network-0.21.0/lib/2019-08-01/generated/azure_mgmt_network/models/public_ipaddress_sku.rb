# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_08_01
  module Models
    #
    # SKU of a public IP address.
    #
    class PublicIPAddressSku

      include MsRestAzure

      # @return [PublicIPAddressSkuName] Name of a public IP address SKU.
      # Possible values include: 'Basic', 'Standard'
      attr_accessor :name


      #
      # Mapper for PublicIPAddressSku class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'PublicIPAddressSku',
          type: {
            name: 'Composite',
            class_name: 'PublicIPAddressSku',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
