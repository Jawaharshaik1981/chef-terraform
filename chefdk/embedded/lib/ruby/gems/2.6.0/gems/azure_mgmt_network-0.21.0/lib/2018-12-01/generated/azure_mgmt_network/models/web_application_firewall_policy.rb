# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_12_01
  module Models
    #
    # Defines web application firewall policy.
    #
    class WebApplicationFirewallPolicy < Resource

      include MsRestAzure

      # @return [PolicySettings] Describes  policySettings for policy
      attr_accessor :policy_settings

      # @return [Array<WebApplicationFirewallCustomRule>] Describes custom
      # rules inside the policy
      attr_accessor :custom_rules

      # @return [Array<ApplicationGateway>] A collection of references to
      # application gateways.
      attr_accessor :application_gateways

      # @return [String] Provisioning state of the
      # WebApplicationFirewallPolicy.
      attr_accessor :provisioning_state

      # @return [WebApplicationFirewallPolicyResourceState] Resource status of
      # the policy. Possible values include: 'Creating', 'Enabling', 'Enabled',
      # 'Disabling', 'Disabled', 'Deleting'
      attr_accessor :resource_state

      # @return [String] Gets a unique read-only string that changes whenever
      # the resource is updated.
      attr_accessor :etag


      #
      # Mapper for WebApplicationFirewallPolicy class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'WebApplicationFirewallPolicy',
          type: {
            name: 'Composite',
            class_name: 'WebApplicationFirewallPolicy',
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
              policy_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.policySettings',
                type: {
                  name: 'Composite',
                  class_name: 'PolicySettings'
                }
              },
              custom_rules: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.customRules',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'WebApplicationFirewallCustomRuleElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'WebApplicationFirewallCustomRule'
                      }
                  }
                }
              },
              application_gateways: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.applicationGateways',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGateway'
                      }
                  }
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              resource_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.resourceState',
                type: {
                  name: 'String'
                }
              },
              etag: {
                client_side_validation: true,
                required: false,
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
