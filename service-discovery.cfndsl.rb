CloudFormation do

  raise "config `namespace` must be defined" if !defined? namespace

  case type.downcase
  when 'public'
    ServiceDiscovery_PrivateDnsNamespace(:PrivateDnsNamespace) {
      Description FnSub("Private namespace #{namespace} for the ${EnvironmentName} environment")
      Name FnSub(namespace)
      Vpc Ref(:VPCId)
    }

    Output(:PrivateDnsNamespace) {
      Value(Ref(:PrivateDnsNamespace))
      Export FnSub("${EnvironmentName}-#{component_name}-PrivateDnsNamespace")
    }
  when 'private'
    ServiceDiscovery_PrivateDnsNamespace(:PublicDnsNamespace) {
      Description FnSub("Public namespace #{namespace} for the ${EnvironmentName} environment")
      Name FnSub(namespace)
    }

    Output(:PublicDnsNamespace) {
      Value(Ref(:PublicDnsNamespace))
      Export FnSub("${EnvironmentName}-#{component_name}-PublicDnsNamespace")
    }
  when 'http'
    ServiceDiscovery_HttpNamespace(:HttpNamespace) {
      Description FnSub("HTTP namespace #{namespace} for the ${EnvironmentName} environment")
      Name FnSub(namespace)
    }

    Output(:HttpNamespace) {
      Value(Ref(:HttpNamespace))
      Export FnSub("${EnvironmentName}-#{component_name}-HttpNamespace")
    }
  else
    raise "namespace `type` must be one of public | private | http"
  end

end
