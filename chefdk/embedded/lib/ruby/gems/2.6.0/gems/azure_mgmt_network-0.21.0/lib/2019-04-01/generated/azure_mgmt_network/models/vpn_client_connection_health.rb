# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_04_01
  module Models
    #
    # VpnClientConnectionHealth properties.
    #
    class VpnClientConnectionHealth

      include MsRestAzure

      # @return [Integer] Total of the Ingress Bytes Transferred in this P2S
      # Vpn connection.
      attr_accessor :total_ingress_bytes_transferred

      # @return [Integer] Total of the Egress Bytes Transferred in this
      # connection.
      attr_accessor :total_egress_bytes_transferred

      # @return [Integer] The total of p2s vpn clients connected at this time
      # to this P2SVpnGateway.
      attr_accessor :vpn_client_connections_count

      # @return [Array<String>] List of allocated ip addresses to the connected
      # p2s vpn clients.
      attr_accessor :allocated_ip_addresses


      #
      # Mapper for VpnClientConnectionHealth class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VpnClientConnectionHealth',
          type: {
            name: 'Composite',
            class_name: 'VpnClientConnectionHealth',
            model_properties: {
              total_ingress_bytes_transferred: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'totalIngressBytesTransferred',
                type: {
                  name: 'Number'
                }
              },
              total_egress_bytes_transferred: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'totalEgressBytesTransferred',
                type: {
                  name: 'Number'
                }
              },
              vpn_client_connections_count: {
                client_side_validation: true,
                required: false,
                serialized_name: 'vpnClientConnectionsCount',
                type: {
                  name: 'Number'
                }
              },
              allocated_ip_addresses: {
                client_side_validation: true,
                required: false,
                serialized_name: 'allocatedIpAddresses',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
