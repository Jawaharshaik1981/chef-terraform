# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2018_10_01
  module Models
    #
    # Identity for the virtual machine.
    #
    class VirtualMachineIdentity

      include MsRestAzure

      # @return [String] The principal id of virtual machine identity. This
      # property will only be provided for a system assigned identity.
      attr_accessor :principal_id

      # @return [String] The tenant id associated with the virtual machine.
      # This property will only be provided for a system assigned identity.
      attr_accessor :tenant_id

      # @return [ResourceIdentityType] The type of identity used for the
      # virtual machine. The type 'SystemAssigned, UserAssigned' includes both
      # an implicitly created identity and a set of user assigned identities.
      # The type 'None' will remove any identities from the virtual machine.
      # Possible values include: 'SystemAssigned', 'UserAssigned',
      # 'SystemAssigned, UserAssigned', 'None'
      attr_accessor :type

      # @return [Hash{String =>
      # VirtualMachineIdentityUserAssignedIdentitiesValue}] The list of user
      # identities associated with the Virtual Machine. The user identity
      # dictionary key references will be ARM resource ids in the form:
      # '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/{identityName}'.
      attr_accessor :user_assigned_identities


      #
      # Mapper for VirtualMachineIdentity class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachineIdentity',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineIdentity',
            model_properties: {
              principal_id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'principalId',
                type: {
                  name: 'String'
                }
              },
              tenant_id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'tenantId',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'type',
                type: {
                  name: 'Enum',
                  module: 'ResourceIdentityType'
                }
              },
              user_assigned_identities: {
                client_side_validation: true,
                required: false,
                serialized_name: 'userAssignedIdentities',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'VirtualMachineIdentityUserAssignedIdentitiesValueElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'VirtualMachineIdentityUserAssignedIdentitiesValue'
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
