# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_06_01
  module Models
    #
    # ExpressRoutePorts Location Bandwidths

    # Real-time inventory of available ExpressRoute port bandwidths.
    #
    class ExpressRoutePortsLocationBandwidths

      include MsRestAzure

      # @return [String] Bandwidth descriptive name.
      attr_accessor :offer_name

      # @return [Integer] Bandwidth value in Gbps.
      attr_accessor :value_in_gbps


      #
      # Mapper for ExpressRoutePortsLocationBandwidths class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ExpressRoutePortsLocationBandwidths',
          type: {
            name: 'Composite',
            class_name: 'ExpressRoutePortsLocationBandwidths',
            model_properties: {
              offer_name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'offerName',
                type: {
                  name: 'String'
                }
              },
              value_in_gbps: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'valueInGbps',
                type: {
                  name: 'Number'
                }
              }
            }
          }
        }
      end
    end
  end
end
