CloudFormation do

  if defined? namespace

    ServiceDiscovery_PrivateDnsNamespace(:PrivateDnsNamespace) {
      Description FnSub("Private namespace #{namespace} for the ${EnvironmentName} environment")
      Name FnSub(namespace)
      Vpc Ref(:VPCId)
    }

    Output(:PrivateDnsNamespace) {
      Value(Ref(:PrivateDnsNamespace))
      Export FnSub("${EnvironmentName}-#{component_name}-PrivateDnsNamespace")
    }

    ServiceDiscovery_HttpNamespace(:HttpNamespace) {
      Description FnSub("HTTP namespace #{namespace} for the ${EnvironmentName} environment")
      Name FnSub(namespace)
    }

    Output(:HttpNamespace) {
      Value(Ref(:HttpNamespace))
      Export FnSub("${EnvironmentName}-#{component_name}-HttpNamespace")
    }

  end

end
