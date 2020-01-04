# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_12_01
  module Models
    #
    # Configuration of the protocol.
    #
    class ProtocolConfiguration

      include MsRestAzure

      # @return [HTTPConfiguration]
      attr_accessor :httpconfiguration


      #
      # Mapper for ProtocolConfiguration class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ProtocolConfiguration',
          type: {
            name: 'Composite',
            class_name: 'ProtocolConfiguration',
            model_properties: {
              httpconfiguration: {
                client_side_validation: true,
                required: false,
                serialized_name: 'HTTPConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'HTTPConfiguration'
                }
              }
            }
          }
        }
      end
    end
  end
end
