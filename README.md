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

## Terraform Variables and DataSources

#### Conditions to start
+ terraform-key in AWS EC2 key pairs

### Terraform Variables

+ Input variables
  - serve as parameters for a Terraform module. Modules can be shared between different configurations
  1. input variables basics
  2. provide when prompted during terraform plan or apply
  3. override default variable using CLI argument ```-var```
  4. override default variable using Environment variables (TF_var_aa)
  5. provider input variables using terraform.tfvars
  6. provide using <name>.tfvars with CLI argument -var-file
  7. provide input using auto.tfvars
  8. implement complex type constructors like ***List & Map***
  9. implement custom validation rules
  10. protect sensitive variables

+ Output values
+ Local values

#### DataSources

- use of data sources allows a Terraform configuration to make use of information defined ***outside of Terraform***, or defined by ***another separate Terraform configuration***
- each data resource is associated with a ***single data source***, which determines ***kind of object (or objects)*** it reads and what ***query constraint arguments*** are available
- Meta-arguments
  - supported = provider, count and for_each
  - not currently supported = lifecycle

#### Outputs

- A child module can use outputs to ***expose a subset*** of its resouce attributes to a ***parent module***
- When using ***remote state***, root module outputs can be accessed by other configurations via a ***terraform_remote state data source***

## Terraform Meta arguments, lists, maps and splat operator

+ Count
+ Lists & Maps (String)
+ Lists, Maps, Maps - Advanced (for loop)
+ Splat Operator . * . and [*]
+ ```for_each```
+ ```toset``` function
+ ```tomap``` function

```Error: Error launching source instance: Unsupported: Your requested instance type (t2.micro) is not supported in your requested Availability Zone (us-west-2d). Please retry your request by not specifying an Availability Zone or choosing us-west-2a, us-west-2b, us-west-2c.
│       status code: 400, request id: e75db6a2-b665-459a-95df-428e5fe77b46
│
│   with aws_instance.vm-data["us-west-2d"],
│   on c5-instances.tf line 11, in resource "aws_instance" "vm-data":
│   11: resource "aws_instance" "vm-data" {
```

### Utility project
Build a solution that gives the availability zone that a desired ec2 instance type (like t2.micro) is supported.

