# service-discovery CfHighlander component
## Parameters

| Name | Use | Default | Global | Type | Allowed Values |
| ---- | --- | ------- | ------ | ---- | -------------- |
| EnvironmentName | Tagging | dev | true | string
| EnvironmentType | Tagging | development | true | string | ['development','production']
| VPCId | VPC ID to connect to | None | false | AWS::EC2::VPC::Id

## Outputs/Exports

| Name | Value | Exported |
| ---- | ----- | -------- |
| NamespaceId | The namespace ID of the service discovery zone | true


## Included Components
[lib-ec2](https://github.com/theonestack/hl-component-lib-ec2)
[lib-iam](https://github.com/theonestack/hl-component-lib-iam)

## Example Configuration
### Highlander
```
  Component name: 'servicediscovery', template: 'service-discovery' do
    parameter name: 'VPCId', value: cfout('vpcv2', 'VPCId')
  end

```
### Service-Discovery Configuration
```
namespace: myappcloud
type: private
```

## Cfhighlander Setup

install cfhighlander [gem](https://github.com/theonestack/cfhighlander)

```bash
gem install cfhighlander
```

or via docker

```bash
docker pull theonestack/cfhighlander
```
## Testing Components

Running the tests

```bash
cfhighlander cftest service-discovery
```