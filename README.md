## Terraform basics

+ Basic Commands
  + Terraform Init
  + Terraform Validate
  + Terraform Plan
  + Terraform Apply
  + Terraform Destroy

#### Conditions to start
+ default vpc on aws
+ verify AWS credentials in ~/.aws/credentials
```
cat user/.aws.credentials
```

## Terraform fundamental blocks

+ Terraform block - ***only constant values can be used***
  + Required terraform version
  + List required providers
  + Terraform backend
+ Provider block
  + Terraform relies on providers to interact with remote systems
  + Declare providers for Terraform to install providers & use them
  + Provider configuration belong to Root module
+ Resource block
  + Resource syntax
  + Resource behavior
  + Provisiones

### Terraform providers

+ Providers requirements - Terraform Block
  + ***aws*** = {
      source = "[HOSTNAME]/<NAMESCAPE>/TYPE"
      verion = "value"  
  }
+ Provider configuration - Provider Block
  + provider ***aws*** {
      configuration options
  }
+ Dependency Lock File

### Resource block

```
<block type> "resource type" "local name" {
  arguments
  <identifier> = <value>  
}
```
+ Syntax
  + Resource type - infrastructure object
  + Resource local name - resource type and name together serve as an identifier for a given resource. Must be unique within a module
  + meta arguments - change the behavior of resources
  + resource arguments - specific to each resource type

  + Resource Behavior - associeted with terraform states
    + Create resource
    + Destrou resource
    + Update in-place resources
    + Destroy and re-create

+ arguments - Inputs for that resource
+ attributes - Outputs from that resource

#### Terraform state File
.tfstate file = Store state about your managed infrastructure and configuration
This state is used by Terraform to map real world resources, keep track of metadata, and to improve performance for large infrastructure.

+ Desired State - Terraform configuration files
+ Current State - Real world resource on AWS