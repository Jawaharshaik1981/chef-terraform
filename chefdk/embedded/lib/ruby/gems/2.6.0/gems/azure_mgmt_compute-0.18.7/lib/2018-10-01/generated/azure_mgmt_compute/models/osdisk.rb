# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2018_10_01
  module Models
    #
    # Specifies information about the operating system disk used by the virtual
    # machine. <br><br> For more information about disks, see [About disks and
    # VHDs for Azure virtual
    # machines](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-about-disks-vhds?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json).
    #
    class OSDisk

      include MsRestAzure

      # @return [OperatingSystemTypes] This property allows you to specify the
      # type of the OS that is included in the disk if creating a VM from
      # user-image or a specialized VHD. <br><br> Possible values are: <br><br>
      # **Windows** <br><br> **Linux**. Possible values include: 'Windows',
      # 'Linux'
      attr_accessor :os_type

      # @return [DiskEncryptionSettings] Specifies the encryption settings for
      # the OS Disk. <br><br> Minimum api-version: 2015-06-15
      attr_accessor :encryption_settings

      # @return [String] The disk name.
      attr_accessor :name

      # @return [VirtualHardDisk] The virtual hard disk.
      attr_accessor :vhd

      # @return [VirtualHardDisk] The source user image virtual hard disk. The
      # virtual hard disk will be copied before being attached to the virtual
      # machine. If SourceImage is provided, the destination virtual hard drive
      # must not exist.
      attr_accessor :image

      # @return [CachingTypes] Specifies the caching requirements. <br><br>
      # Possible values are: <br><br> **None** <br><br> **ReadOnly** <br><br>
      # **ReadWrite** <br><br> Default: **None for Standard storage. ReadOnly
      # for Premium storage**. Possible values include: 'None', 'ReadOnly',
      # 'ReadWrite'
      attr_accessor :caching

      # @return [Boolean] Specifies whether writeAccelerator should be enabled
      # or disabled on the disk.
      attr_accessor :write_accelerator_enabled

      # @return [DiffDiskSettings] Specifies the ephemeral Disk Settings for
      # the operating system disk used by the virtual machine.
      attr_accessor :diff_disk_settings

      # @return [DiskCreateOptionTypes] Specifies how the virtual machine
      # should be created.<br><br> Possible values are:<br><br> **Attach**
      # \u2013 This value is used when you are using a specialized disk to
      # create the virtual machine.<br><br> **FromImage** \u2013 This value is
      # used when you are using an image to create the virtual machine. If you
      # are using a platform image, you also use the imageReference element
      # described above. If you are using a marketplace image, you  also use
      # the plan element previously described. Possible values include:
      # 'FromImage', 'Empty', 'Attach'
      attr_accessor :create_option

      # @return [Integer] Specifies the size of an empty data disk in
      # gigabytes. This element can be used to overwrite the size of the disk
      # in a virtual machine image. <br><br> This value cannot be larger than
      # 1023 GB
      attr_accessor :disk_size_gb

      # @return [ManagedDiskParameters] The managed disk parameters.
      attr_accessor :managed_disk


      #
      # Mapper for OSDisk class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'OSDisk',
          type: {
            name: 'Composite',
            class_name: 'OSDisk',
            model_properties: {
              os_type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'osType',
                type: {
                  name: 'Enum',
                  module: 'OperatingSystemTypes'
                }
              },
              encryption_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'encryptionSettings',
                type: {
                  name: 'Composite',
                  class_name: 'DiskEncryptionSettings'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              vhd: {
                client_side_validation: true,
                required: false,
                serialized_name: 'vhd',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualHardDisk'
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
              caching: {
                client_side_validation: true,
                required: false,
                serialized_name: 'caching',
                type: {
                  name: 'Enum',
                  module: 'CachingTypes'
                }
              },
              write_accelerator_enabled: {
                client_side_validation: true,
                required: false,
                serialized_name: 'writeAcceleratorEnabled',
                type: {
                  name: 'Boolean'
                }
              },
              diff_disk_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'diffDiskSettings',
                type: {
                  name: 'Composite',
                  class_name: 'DiffDiskSettings'
                }
              },
              create_option: {
                client_side_validation: true,
                required: true,
                serialized_name: 'createOption',
                type: {
                  name: 'String'
                }
              },
              disk_size_gb: {
                client_side_validation: true,
                required: false,
                serialized_name: 'diskSizeGB',
                type: {
                  name: 'Number'
                }
              },
              managed_disk: {
                client_side_validation: true,
                required: false,
                serialized_name: 'managedDisk',
                type: {
                  name: 'Composite',
                  class_name: 'ManagedDiskParameters'
                }
              }
            }
          }
        }
      end
    end
  end
end
