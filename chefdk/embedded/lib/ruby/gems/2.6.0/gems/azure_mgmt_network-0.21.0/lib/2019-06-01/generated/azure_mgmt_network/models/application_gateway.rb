# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_06_01
  module Models
    #
    # Application gateway resource.
    #
    class ApplicationGateway < Resource

      include MsRestAzure

      # @return [ApplicationGatewaySku] SKU of the application gateway
      # resource.
      attr_accessor :sku

      # @return [ApplicationGatewaySslPolicy] SSL policy of the application
      # gateway resource.
      attr_accessor :ssl_policy

      # @return [ApplicationGatewayOperationalState] Operational state of the
      # application gateway resource. Possible values include: 'Stopped',
      # 'Starting', 'Running', 'Stopping'
      attr_accessor :operational_state

      # @return [Array<ApplicationGatewayIPConfiguration>] Subnets of the
      # application gateway resource. For default limits, see [Application
      # Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :gateway_ipconfigurations

      # @return [Array<ApplicationGatewayAuthenticationCertificate>]
      # Authentication certificates of the application gateway resource. For
      # default limits, see [Application Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :authentication_certificates

      # @return [Array<ApplicationGatewayTrustedRootCertificate>] Trusted Root
      # certificates of the application gateway resource. For default limits,
      # see [Application Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :trusted_root_certificates

      # @return [Array<ApplicationGatewaySslCertificate>] SSL certificates of
      # the application gateway resource. For default limits, see [Application
      # Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :ssl_certificates

      # @return [Array<ApplicationGatewayFrontendIPConfiguration>] Frontend IP
      # addresses of the application gateway resource. For default limits, see
      # [Application Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :frontend_ipconfigurations

      # @return [Array<ApplicationGatewayFrontendPort>] Frontend ports of the
      # application gateway resource. For default limits, see [Application
      # Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :frontend_ports

      # @return [Array<ApplicationGatewayProbe>] Probes of the application
      # gateway resource.
      attr_accessor :probes

      # @return [Array<ApplicationGatewayBackendAddressPool>] Backend address
      # pool of the application gateway resource. For default limits, see
      # [Application Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :backend_address_pools

      # @return [Array<ApplicationGatewayBackendHttpSettings>] Backend http
      # settings of the application gateway resource. For default limits, see
      # [Application Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :backend_http_settings_collection

      # @return [Array<ApplicationGatewayHttpListener>] Http listeners of the
      # application gateway resource. For default limits, see [Application
      # Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :http_listeners

      # @return [Array<ApplicationGatewayUrlPathMap>] URL path map of the
      # application gateway resource. For default limits, see [Application
      # Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :url_path_maps

      # @return [Array<ApplicationGatewayRequestRoutingRule>] Request routing
      # rules of the application gateway resource.
      attr_accessor :request_routing_rules

      # @return [Array<ApplicationGatewayRewriteRuleSet>] Rewrite rules for the
      # application gateway resource.
      attr_accessor :rewrite_rule_sets

      # @return [Array<ApplicationGatewayRedirectConfiguration>] Redirect
      # configurations of the application gateway resource. For default limits,
      # see [Application Gateway
      # limits](https://docs.microsoft.com/azure/azure-subscription-service-limits#application-gateway-limits).
      attr_accessor :redirect_configurations

      # @return [ApplicationGatewayWebApplicationFirewallConfiguration] Web
      # application firewall configuration.
      attr_accessor :web_application_firewall_configuration

      # @return [SubResource] Reference of the FirewallPolicy resource.
      attr_accessor :firewall_policy

      # @return [Boolean] Whether HTTP2 is enabled on the application gateway
      # resource.
      attr_accessor :enable_http2

      # @return [Boolean] Whether FIPS is enabled on the application gateway
      # resource.
      attr_accessor :enable_fips

      # @return [ApplicationGatewayAutoscaleConfiguration] Autoscale
      # Configuration.
      attr_accessor :autoscale_configuration

      # @return [String] Resource GUID property of the application gateway
      # resource.
      attr_accessor :resource_guid

      # @return [String] Provisioning state of the application gateway
      # resource. Possible values are: 'Updating', 'Deleting', and 'Failed'.
      attr_accessor :provisioning_state

      # @return [Array<ApplicationGatewayCustomError>] Custom error
      # configurations of the application gateway resource.
      attr_accessor :custom_error_configurations

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag

      # @return [Array<String>] A list of availability zones denoting where the
      # resource needs to come from.
      attr_accessor :zones

      # @return [ManagedServiceIdentity] The identity of the application
      # gateway, if configured.
      attr_accessor :identity


      #
      # Mapper for ApplicationGateway class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ApplicationGateway',
          type: {
            name: 'Composite',
            class_name: 'ApplicationGateway',
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
              sku: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.sku',
                type: {
                  name: 'Composite',
                  class_name: 'ApplicationGatewaySku'
                }
              },
              ssl_policy: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.sslPolicy',
                type: {
                  name: 'Composite',
                  class_name: 'ApplicationGatewaySslPolicy'
                }
              },
              operational_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.operationalState',
                type: {
                  name: 'String'
                }
              },
              gateway_ipconfigurations: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.gatewayIPConfigurations',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayIPConfigurationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayIPConfiguration'
                      }
                  }
                }
              },
              authentication_certificates: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.authenticationCertificates',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayAuthenticationCertificateElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayAuthenticationCertificate'
                      }
                  }
                }
              },
              trusted_root_certificates: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.trustedRootCertificates',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayTrustedRootCertificateElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayTrustedRootCertificate'
                      }
                  }
                }
              },
              ssl_certificates: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.sslCertificates',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewaySslCertificateElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewaySslCertificate'
                      }
                  }
                }
              },
              frontend_ipconfigurations: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.frontendIPConfigurations',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayFrontendIPConfigurationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayFrontendIPConfiguration'
                      }
                  }
                }
              },
              frontend_ports: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.frontendPorts',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayFrontendPortElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayFrontendPort'
                      }
                  }
                }
              },
              probes: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.probes',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayProbeElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayProbe'
                      }
                  }
                }
              },
              backend_address_pools: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.backendAddressPools',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayBackendAddressPoolElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayBackendAddressPool'
                      }
                  }
                }
              },
              backend_http_settings_collection: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.backendHttpSettingsCollection',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayBackendHttpSettingsElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayBackendHttpSettings'
                      }
                  }
                }
              },
              http_listeners: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.httpListeners',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayHttpListenerElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayHttpListener'
                      }
                  }
                }
              },
              url_path_maps: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.urlPathMaps',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayUrlPathMapElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayUrlPathMap'
                      }
                  }
                }
              },
              request_routing_rules: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.requestRoutingRules',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayRequestRoutingRuleElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayRequestRoutingRule'
                      }
                  }
                }
              },
              rewrite_rule_sets: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.rewriteRuleSets',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayRewriteRuleSetElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayRewriteRuleSet'
                      }
                  }
                }
              },
              redirect_configurations: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.redirectConfigurations',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayRedirectConfigurationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayRedirectConfiguration'
                      }
                  }
                }
              },
              web_application_firewall_configuration: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.webApplicationFirewallConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'ApplicationGatewayWebApplicationFirewallConfiguration'
                }
              },
              firewall_policy: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.firewallPolicy',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              enable_http2: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.enableHttp2',
                type: {
                  name: 'Boolean'
                }
              },
              enable_fips: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.enableFips',
                type: {
                  name: 'Boolean'
                }
              },
              autoscale_configuration: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.autoscaleConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'ApplicationGatewayAutoscaleConfiguration'
                }
              },
              resource_guid: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.resourceGuid',
                type: {
                  name: 'String'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              custom_error_configurations: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.customErrorConfigurations',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ApplicationGatewayCustomErrorElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ApplicationGatewayCustomError'
                      }
                  }
                }
              },
              etag: {
                client_side_validation: true,
                required: false,
                serialized_name: 'etag',
                type: {
                  name: 'String'
                }
              },
              zones: {
                client_side_validation: true,
                required: false,
                serialized_name: 'zones',
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
              },
              identity: {
                client_side_validation: true,
                required: false,
                serialized_name: 'identity',
                type: {
                  name: 'Composite',
                  class_name: 'ManagedServiceIdentity'
                }
              }
            }
          }
        }
      end
    end
  end
end
