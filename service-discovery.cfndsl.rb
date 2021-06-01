CloudFormation do

  raise "config `namespace` must be defined" if !defined? namespace

  case type.downcase
  when 'private'
    ServiceDiscovery_PrivateDnsNamespace(:PrivateDnsNamespace) {
      Description FnSub("Private namespace #{namespace} for the ${EnvironmentName} environment")
      Name FnSub(namespace)
      Vpc Ref(:VPCId)
    }

    Output(:NamespaceId) {
      Value(Ref(:PrivateDnsNamespace))
      Export FnSub("${EnvironmentName}-#{component_name}-NamespaceId")
    }
  when 'public'
    ServiceDiscovery_PublicDnsNamespace(:PublicDnsNamespace) {
      Description FnSub("Public namespace #{namespace} for the ${EnvironmentName} environment")
      Name FnSub(namespace)
    }

    Output(:NamespaceId) {
      Value(Ref(:PublicDnsNamespace))
      Export FnSub("${EnvironmentName}-#{component_name}-NamespaceId")
    }
  when 'http'
    ServiceDiscovery_HttpNamespace(:HttpNamespace) {
      Description FnSub("HTTP namespace #{namespace} for the ${EnvironmentName} environment")
      Name FnSub(namespace)
    }

    Output(:NamespaceId) {
      Value(Ref(:HttpNamespace))
      Export FnSub("${EnvironmentName}-#{component_name}-NamespaceId")
    }
  else
    raise "namespace `type` must be one of public | private | http"
  end

end
