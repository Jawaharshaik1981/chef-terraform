# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2018_09_30
  module Models
    #
    # Key Vault Key Url and vault id of KeK, KeK is optional and when provided
    # is used to unwrap the encryptionKey
    #
    class KeyVaultAndKeyReference

      include MsRestAzure

      # @return [SourceVault] Resource id of the KeyVault containing the key or
      # secret
      attr_accessor :source_vault

      # @return [String] Url pointing to a key or secret in KeyVault
      attr_accessor :key_url


      #
      # Mapper for KeyVaultAndKeyReference class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'KeyVaultAndKeyReference',
          type: {
            name: 'Composite',
            class_name: 'KeyVaultAndKeyReference',
            model_properties: {
              source_vault: {
                client_side_validation: true,
                required: true,
                serialized_name: 'sourceVault',
                type: {
                  name: 'Composite',
                  class_name: 'SourceVault'
                }
              },
              key_url: {
                client_side_validation: true,
                required: true,
                serialized_name: 'keyUrl',
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
