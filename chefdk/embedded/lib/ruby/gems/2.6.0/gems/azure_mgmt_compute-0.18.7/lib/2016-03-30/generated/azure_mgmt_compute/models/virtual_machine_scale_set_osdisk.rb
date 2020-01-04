# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2016_03_30
  module Models
    #
    # Describes a virtual machine scale set operating system disk.
    #
    class VirtualMachineScaleSetOSDisk

      include MsRestAzure

      # @return [String] The disk name.
      attr_accessor :name

      # @return [CachingTypes] Specifies the caching requirements. <br><br>
      # Possible values are: <br><br> **None** <br><br> **ReadOnly** <br><br>
      # **ReadWrite** <br><br> Default: **None for Standard storage. ReadOnly
      # for Premium storage**. Possible values include: 'None', 'ReadOnly',
      # 'ReadWrite'
      attr_accessor :caching

      # @return [DiskCreateOptionTypes] Specifies how the virtual machines in
      # the scale set should be created.<br><br> The only allowed value is:
      # **FromImage** \u2013 This value is used when you are using an image to
      # create the virtual machine. If you are using a platform image, you also
      # use the imageReference element described above. If you are using a
      # marketplace image, you  also use the plan element previously described.
      # Possible values include: 'FromImage', 'Empty', 'Attach'
      attr_accessor :create_option

      # @return [OperatingSystemTypes] This property allows you to specify the
      # type of the OS that is included in the disk if creating a VM from
      # user-image or a specialized VHD. <br><br> Possible values are: <br><br>
      # **Windows** <br><br> **Linux**. Possible values include: 'Windows',
      # 'Linux'
      attr_accessor :os_type

      # @return [VirtualHardDisk] The Source User Image VirtualHardDisk. This
      # VirtualHardDisk will be copied before using it to attach to the Virtual
      # Machine. If SourceImage is provided, the destination VirtualHardDisk
      # should not exist.
      attr_accessor :image

      # @return [Array<String>] The list of virtual hard disk container uris.
      attr_accessor :vhd_containers


      #
      # Mapper for VirtualMachineScaleSetOSDisk class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachineScaleSetOSDisk',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineScaleSetOSDisk',
            model_properties: {
              name: {
                client_side_validation: true,
                required: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              caching: {
                client_side_validation: true,
                required: false,
                serialized_name: 'caching',
                type: {
                  name: 'Enum',
                  module: 'CachingTypes'
                }
              },
              create_option: {
                client_side_validation: true,
                required: true,
                serialized_name: 'createOption',
                type: {
                  name: 'Enum',
                  module: 'DiskCreateOptionTypes'
                }
              },
              os_type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'osType',
                type: {
                  name: 'Enum',
                  module: 'OperatingSystemTypes'
                }
              },
              image: {
                client_side_validation: true,
                required: false,
                serialized_name: 'image',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualHardDisk'
                }
              },
              vhd_containers: {
                client_side_validation: true,
                required: false,
                serialized_name: 'vhdContainers',
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
