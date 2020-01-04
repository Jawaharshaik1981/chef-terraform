# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2018_04_01
  module Models
    #
    # A disk access SAS uri.
    #
    class AccessUri

      include MsRestAzure

      # @return [String] A SAS uri for accessing a disk.
      attr_accessor :access_sas


      #
      # Mapper for AccessUri class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'AccessUri',
          type: {
            name: 'Composite',
            class_name: 'AccessUri',
            model_properties: {
              access_sas: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'accessSAS',
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
