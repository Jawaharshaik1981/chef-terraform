# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2018_10_01
  module Models
    #
    # The instance view of a virtual machine scale set VM.
    #
    class VirtualMachineScaleSetVMInstanceView

      include MsRestAzure

      # @return [Integer] The Update Domain count.
      attr_accessor :platform_update_domain

      # @return [Integer] The Fault Domain count.
      attr_accessor :platform_fault_domain

      # @return [String] The Remote desktop certificate thumbprint.
      attr_accessor :rdp_thumb_print

      # @return [VirtualMachineAgentInstanceView] The VM Agent running on the
      # virtual machine.
      attr_accessor :vm_agent

      # @return [MaintenanceRedeployStatus] The Maintenance Operation status on
      # the virtual machine.
      attr_accessor :maintenance_redeploy_status

      # @return [Array<DiskInstanceView>] The disks information.
      attr_accessor :disks

      # @return [Array<VirtualMachineExtensionInstanceView>] The extensions
      # information.
      attr_accessor :extensions

      # @return [VirtualMachineHealthStatus] The health status for the VM.
      attr_accessor :vm_health

      # @return [BootDiagnosticsInstanceView] Boot Diagnostics is a debugging
      # feature which allows you to view Console Output and Screenshot to
      # diagnose VM status. <br><br> You can easily view the output of your
      # console log. <br><br> Azure also enables you to see a screenshot of the
      # VM from the hypervisor.
      attr_accessor :boot_diagnostics

      # @return [Array<InstanceViewStatus>] The resource status information.
      attr_accessor :statuses

      # @return [String] The placement group in which the VM is running. If the
      # VM is deallocated it will not have a placementGroupId.
      attr_accessor :placement_group_id


      #
      # Mapper for VirtualMachineScaleSetVMInstanceView class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachineScaleSetVMInstanceView',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineScaleSetVMInstanceView',
            model_properties: {
              platform_update_domain: {
                client_side_validation: true,
                required: false,
                serialized_name: 'platformUpdateDomain',
                type: {
                  name: 'Number'
                }
              },
              platform_fault_domain: {
                client_side_validation: true,
                required: false,
                serialized_name: 'platformFaultDomain',
                type: {
                  name: 'Number'
                }
              },
              rdp_thumb_print: {
                client_side_validation: true,
                required: false,
                serialized_name: 'rdpThumbPrint',
                type: {
                  name: 'String'
                }
              },
              vm_agent: {
                client_side_validation: true,
                required: false,
                serialized_name: 'vmAgent',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualMachineAgentInstanceView'
                }
              },
              maintenance_redeploy_status: {
                client_side_validation: true,
                required: false,
                serialized_name: 'maintenanceRedeployStatus',
                type: {
                  name: 'Composite',
                  class_name: 'MaintenanceRedeployStatus'
                }
              },
              disks: {
                client_side_validation: true,
                required: false,
                serialized_name: 'disks',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'DiskInstanceViewElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'DiskInstanceView'
                      }
                  }
                }
              },
              extensions: {
                client_side_validation: true,
                required: false,
                serialized_name: 'extensions',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'VirtualMachineExtensionInstanceViewElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'VirtualMachineExtensionInstanceView'
                      }
                  }
                }
              },
              vm_health: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'vmHealth',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualMachineHealthStatus'
                }
              },
              boot_diagnostics: {
                client_side_validation: true,
                required: false,
                serialized_name: 'bootDiagnostics',
                type: {
                  name: 'Composite',
                  class_name: 'BootDiagnosticsInstanceView'
                }
              },
              statuses: {
                client_side_validation: true,
                required: false,
                serialized_name: 'statuses',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'InstanceViewStatusElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'InstanceViewStatus'
                      }
                  }
                }
              },
              placement_group_id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'placementGroupId',
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
