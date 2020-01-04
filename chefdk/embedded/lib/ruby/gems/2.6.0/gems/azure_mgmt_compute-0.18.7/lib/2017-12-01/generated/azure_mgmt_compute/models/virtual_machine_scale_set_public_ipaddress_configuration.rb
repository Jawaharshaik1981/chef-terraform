# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2017_12_01
  module Models
    #
    # Describes a virtual machines scale set IP Configuration's PublicIPAddress
    # configuration
    #
    class VirtualMachineScaleSetPublicIPAddressConfiguration

      include MsRestAzure

      # @return [String] The publicIP address configuration name.
      attr_accessor :name

      # @return [Integer] The idle timeout of the public IP address.
      attr_accessor :idle_timeout_in_minutes

      # @return [VirtualMachineScaleSetPublicIPAddressConfigurationDnsSettings]
      # The dns settings to be applied on the publicIP addresses .
      attr_accessor :dns_settings


      #
      # Mapper for VirtualMachineScaleSetPublicIPAddressConfiguration class as
      # Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachineScaleSetPublicIPAddressConfiguration',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineScaleSetPublicIPAddressConfiguration',
            model_properties: {
              name: {
                client_side_validation: true,
                required: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              idle_timeout_in_minutes: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.idleTimeoutInMinutes',
                type: {
                  name: 'Number'
                }
              },
              dns_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.dnsSettings',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualMachineScaleSetPublicIPAddressConfigurationDnsSettings'
                }
              }
            }
          }
        }
      end
    end
  end
end
