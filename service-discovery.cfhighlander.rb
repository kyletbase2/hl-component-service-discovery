CfhighlanderTemplate do
  Name 'service-discovery'
  Description "service-discovery - #{component_version}"

  Parameters do
    ComponentParam 'EnvironmentName', 'dev', isGlobal: true
    ComponentParam 'EnvironmentType', 'development', allowedValues: ['development','production'], isGlobal: true
    ComponentParam 'VPCId', type: 'AWS::EC2::VPC::Id' if type == 'private'
  end


end
