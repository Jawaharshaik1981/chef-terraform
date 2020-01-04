# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2017_11_01
  module Models
    #
    # Response for GetConnectionSharedKey API service call
    #
    class ConnectionSharedKey

      include MsRestAzure

      # @return [String] The virtual network connection shared key value.
      attr_accessor :value


      #
      # Mapper for ConnectionSharedKey class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ConnectionSharedKey',
          type: {
            name: 'Composite',
            class_name: 'ConnectionSharedKey',
            model_properties: {
              value: {
                client_side_validation: true,
                required: true,
                serialized_name: 'value',
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
