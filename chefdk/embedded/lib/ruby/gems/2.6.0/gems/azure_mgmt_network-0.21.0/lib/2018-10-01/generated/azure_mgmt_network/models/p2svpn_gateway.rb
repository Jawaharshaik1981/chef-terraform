# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_10_01
  module Models
    #
    # P2SVpnGateway Resource.
    #
    class P2SVpnGateway < Resource

      include MsRestAzure

      # @return [SubResource] The VirtualHub to which the gateway belongs
      attr_accessor :virtual_hub

      # @return [ProvisioningState] The provisioning state of the resource.
      # Possible values include: 'Succeeded', 'Updating', 'Deleting', 'Failed'
      attr_accessor :provisioning_state

      # @return [Integer] The scale unit for this p2s vpn gateway.
      attr_accessor :vpn_gateway_scale_unit

      # @return [SubResource] The P2SVpnServerConfiguration to which the
      # p2sVpnGateway is attached to.
      attr_accessor :p2svpn_server_configuration

      # @return [AddressSpace] The reference of the address space resource
      # which represents Address space for P2S VpnClient.
      attr_accessor :vpn_client_address_pool

      # @return [VpnClientConnectionHealth] All P2S VPN clients' connection
      # health status.
      attr_accessor :vpn_client_connection_health

      # @return [String] Gets a unique read-only string that changes whenever
      # the resource is updated.
      attr_accessor :etag


      #
      # Mapper for P2SVpnGateway class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'P2SVpnGateway',
          type: {
            name: 'Composite',
            class_name: 'P2SVpnGateway',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              location: {
                client_side_validation: true,
                required: false,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              tags: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              virtual_hub: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.virtualHub',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              vpn_gateway_scale_unit: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.vpnGatewayScaleUnit',
                type: {
                  name: 'Number'
                }
              },
              p2svpn_server_configuration: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.p2SVpnServerConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              vpn_client_address_pool: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.vpnClientAddressPool',
                type: {
                  name: 'Composite',
                  class_name: 'AddressSpace'
                }
              },
              vpn_client_connection_health: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.vpnClientConnectionHealth',
                type: {
                  name: 'Composite',
                  class_name: 'VpnClientConnectionHealth'
                }
              },
              etag: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'etag',
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
