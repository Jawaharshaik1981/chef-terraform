# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_02_01
  module Models
    #
    # Details of on demand test probe request
    #
    class ApplicationGatewayOnDemandProbe

      include MsRestAzure

      # @return [ApplicationGatewayProtocol] The protocol used for the probe.
      # Possible values include: 'Http', 'Https'
      attr_accessor :protocol

      # @return [String] Host name to send the probe to.
      attr_accessor :host

      # @return [String] Relative path of probe. Valid path starts from '/'.
      # Probe is sent to <Protocol>://<host>:<port><path>
      attr_accessor :path

      # @return [Integer] The probe timeout in seconds. Probe marked as failed
      # if valid response is not received with this timeout period. Acceptable
      # values are from 1 second to 86400 seconds.
      attr_accessor :timeout

      # @return [Boolean] Whether the host header should be picked from the
      # backend http settings. Default value is false.
      attr_accessor :pick_host_name_from_backend_http_settings

      # @return [ApplicationGatewayProbeHealthResponseMatch] Criterion for
      # classifying a healthy probe response.
      attr_accessor :match

      # @return [SubResource] Reference of backend pool of application gateway
      # to which probe request will be sent.
      attr_accessor :backend_address_pool

      # @return [SubResource] Reference of backend http setting of application
      # gateway to be used for test probe.
      attr_accessor :backend_http_settings


      #
      # Mapper for ApplicationGatewayOnDemandProbe class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ApplicationGatewayOnDemandProbe',
          type: {
            name: 'Composite',
            class_name: 'ApplicationGatewayOnDemandProbe',
            model_properties: {
              protocol: {
                client_side_validation: true,
                required: false,
                serialized_name: 'protocol',
                type: {
                  name: 'String'
                }
              },
              host: {
                client_side_validation: true,
                required: false,
                serialized_name: 'host',
                type: {
                  name: 'String'
                }
              },
              path: {
                client_side_validation: true,
                required: false,
                serialized_name: 'path',
                type: {
                  name: 'String'
                }
              },
              timeout: {
                client_side_validation: true,
                required: false,
                serialized_name: 'timeout',
                type: {
                  name: 'Number'
                }
              },
              pick_host_name_from_backend_http_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'pickHostNameFromBackendHttpSettings',
                type: {
                  name: 'Boolean'
                }
              },
              match: {
                client_side_validation: true,
                required: false,
                serialized_name: 'match',
                type: {
                  name: 'Composite',
                  class_name: 'ApplicationGatewayProbeHealthResponseMatch'
                }
              },
              backend_address_pool: {
                client_side_validation: true,
                required: false,
                serialized_name: 'backendAddressPool',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              backend_http_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'backendHttpSettings',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              }
            }
          }
        }
      end
    end
  end
end
