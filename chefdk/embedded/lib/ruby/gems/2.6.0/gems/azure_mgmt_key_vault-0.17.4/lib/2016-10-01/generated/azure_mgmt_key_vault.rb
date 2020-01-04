# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require 'uri'
require 'cgi'
require 'date'
require 'json'
require 'base64'
require 'erb'
require 'securerandom'
require 'time'
require 'timeliness'
require 'faraday'
require 'faraday-cookie_jar'
require 'concurrent'
require 'ms_rest'
require '2016-10-01/generated/azure_mgmt_key_vault/module_definition'
require 'ms_rest_azure'

module Azure::KeyVault::Mgmt::V2016_10_01
  autoload :Vaults,                                             '2016-10-01/generated/azure_mgmt_key_vault/vaults.rb'
  autoload :Operations,                                         '2016-10-01/generated/azure_mgmt_key_vault/operations.rb'
  autoload :KeyVaultManagementClient,                           '2016-10-01/generated/azure_mgmt_key_vault/key_vault_management_client.rb'

  module Models
    autoload :DeletedVault,                                       '2016-10-01/generated/azure_mgmt_key_vault/models/deleted_vault.rb'
    autoload :VaultListResult,                                    '2016-10-01/generated/azure_mgmt_key_vault/models/vault_list_result.rb'
    autoload :Permissions,                                        '2016-10-01/generated/azure_mgmt_key_vault/models/permissions.rb'
    autoload :DeletedVaultListResult,                             '2016-10-01/generated/azure_mgmt_key_vault/models/deleted_vault_list_result.rb'
    autoload :VaultProperties,                                    '2016-10-01/generated/azure_mgmt_key_vault/models/vault_properties.rb'
    autoload :Resource,                                           '2016-10-01/generated/azure_mgmt_key_vault/models/resource.rb'
    autoload :VaultAccessPolicyProperties,                        '2016-10-01/generated/azure_mgmt_key_vault/models/vault_access_policy_properties.rb'
    autoload :ResourceListResult,                                 '2016-10-01/generated/azure_mgmt_key_vault/models/resource_list_result.rb'
    autoload :VaultCreateOrUpdateParameters,                      '2016-10-01/generated/azure_mgmt_key_vault/models/vault_create_or_update_parameters.rb'
    autoload :VaultCheckNameAvailabilityParameters,               '2016-10-01/generated/azure_mgmt_key_vault/models/vault_check_name_availability_parameters.rb'
    autoload :VaultAccessPolicyParameters,                        '2016-10-01/generated/azure_mgmt_key_vault/models/vault_access_policy_parameters.rb'
    autoload :CheckNameAvailabilityResult,                        '2016-10-01/generated/azure_mgmt_key_vault/models/check_name_availability_result.rb'
    autoload :Sku,                                                '2016-10-01/generated/azure_mgmt_key_vault/models/sku.rb'
    autoload :OperationDisplay,                                   '2016-10-01/generated/azure_mgmt_key_vault/models/operation_display.rb'
    autoload :VaultPatchProperties,                               '2016-10-01/generated/azure_mgmt_key_vault/models/vault_patch_properties.rb'
    autoload :LogSpecification,                                   '2016-10-01/generated/azure_mgmt_key_vault/models/log_specification.rb'
    autoload :VaultPatchParameters,                               '2016-10-01/generated/azure_mgmt_key_vault/models/vault_patch_parameters.rb'
    autoload :ServiceSpecification,                               '2016-10-01/generated/azure_mgmt_key_vault/models/service_specification.rb'
    autoload :AccessPolicyEntry,                                  '2016-10-01/generated/azure_mgmt_key_vault/models/access_policy_entry.rb'
    autoload :Operation,                                          '2016-10-01/generated/azure_mgmt_key_vault/models/operation.rb'
    autoload :DeletedVaultProperties,                             '2016-10-01/generated/azure_mgmt_key_vault/models/deleted_vault_properties.rb'
    autoload :OperationListResult,                                '2016-10-01/generated/azure_mgmt_key_vault/models/operation_list_result.rb'
    autoload :Vault,                                              '2016-10-01/generated/azure_mgmt_key_vault/models/vault.rb'
    autoload :SkuName,                                            '2016-10-01/generated/azure_mgmt_key_vault/models/sku_name.rb'
    autoload :KeyPermissions,                                     '2016-10-01/generated/azure_mgmt_key_vault/models/key_permissions.rb'
    autoload :SecretPermissions,                                  '2016-10-01/generated/azure_mgmt_key_vault/models/secret_permissions.rb'
    autoload :CertificatePermissions,                             '2016-10-01/generated/azure_mgmt_key_vault/models/certificate_permissions.rb'
    autoload :StoragePermissions,                                 '2016-10-01/generated/azure_mgmt_key_vault/models/storage_permissions.rb'
    autoload :CreateMode,                                         '2016-10-01/generated/azure_mgmt_key_vault/models/create_mode.rb'
    autoload :Reason,                                             '2016-10-01/generated/azure_mgmt_key_vault/models/reason.rb'
    autoload :AccessPolicyUpdateKind,                             '2016-10-01/generated/azure_mgmt_key_vault/models/access_policy_update_kind.rb'
  end
end