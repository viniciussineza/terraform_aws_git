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

```
aws ec2 describe-instance-type-offerings --location-type availability-zone --filters Name=instance-type,Values=t2.micro --region us-west-2 --output table
```

+ Keys function to select in a tomap output just key information

## VPC using terraform

### First creating resources with AWS management console

+ VCP
+ Internet Gateway
+ NAT Gateway
+ Elastic IP address
+ Route table
+ Public subnet
+ Private subnet

#### Step by Step

1. Create VPC
  Name: manual-VPC
  IPv4 CIDR Block: 10.0.0.0/16

2. Create Subnets
  + Public
  VPC ID: manual-VPC
  Subnet name: public-sn-1
  Availability zone: us-west-2a
  IPv4 CIDR Block: 10.0.1.0/24

  + Private
  Subnet name: private-sn-1
  Availability zone: us-west-2a
  IPv4 CIDR Block: 10.0.101.0/24

3. Internet Gateway and Associate to VPC
  Name tag: vpc-igw
  Actions => Attach to VPC => manual-VPC

4. NAT Gateway
  Name: nat-gateway
  subnet: public-sn-1
  Allocate elastic IP

5. Public Route Table, Routes and associate to subnets
  1. Public Route Table
  Name tag: public-RT
  VPC: manual-VPC

  2. Public Route
  Add Route
  Destination: 0.0.0.0/0
  Target: vpc-igw

  3. Associate Public subnet
  name: public-sn-1

6. Private Route Table, Routes associate to subnets
  1. Private Route Table
  Name tag: private-RT
  VPC: manual-VPC

  2. Private Route
  Add Route
  Destination: 0.0.0.0/0
  Target: nat-gateway

  3. Associate Private subnet
  name: private-sn-1

### Learning about

+ Terraform Modules
+ Terraform variables - terraform.tfvars
+ Terraform variables - vpc.auto-tfvars
+ Terraform version constrains
+ Terraform code organization - Production Grade style

#### Terraform Modules

Containers for multiple resources that are used together. A module consists of a collection of .tf files in a directory.
+ The may way to package and reuse resource configurations
+ Every terraform configuration has at least one module, known as root module
+ A module (usually the root module) can call other modules to include their resources into the configuration
+ A module that has been called is referred as a child module
+ A Child module can be called multiple times within the same configuration. And multiple configurations can use the same child module.
+ Terraform can load modules from local filesystem, public or private registry. By that you can create modules and publish them for others to use.

