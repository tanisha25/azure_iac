# azure_iac
Terraform code for provisioning the resources in Azure

## Code structure
**azure_iac**
├── main.tf               
├── terraform.tfvars      
├── output.tf             
├── variables.tf          
├── providers.tf          
└── modules/             
    ├── virtual-network/ 
    │   ├── main.tf       
    │   ├── variables.tf  
    │   └── output.tf     
    ├── storage-account/  
    ├── random-name/     
    └── resource-group/   


main.tf: This is the primary entry point for Terraform. Here, you'll define which modules you want to use and any resources you want to create at the root level.

terraform.tfvars: This file contains the actual values for your variables which are declared in variables.tf. It's typically ignored by version control (e.g., in .gitignore) to prevent sensitive data from being pushed to shared repositories.

output.tf: This file declares outputs that you want to retrieve from your Terraform configurations. For instance, after provisioning a virtual machine, you might want to output its public IP address.

variables.tf: Here, you'll declare any variables you want to use in your main.tf. This doesn't contain the values but only the variable declarations.

providers.tf: This is where you configure any providers you're using, most commonly the terraform provider and the azurerm provider if you're working with Azure. This might include configurations like version constraints and feature arguments.

modules/ directory: This directory contains all your module definitions. Each module will have its own directory with its own set of .tf files:

main.tf: Every module will have its primary configuration in a main.tf file. This includes the resources that the module is responsible for provisioning.

variables.tf: This file contains the declarations of variables the module uses.

output.tf: If you want to retrieve specific data from a module, you'll declare your outputs in this file.

Each module (like virtual-network, storage-account, random-name, resource-group) will follow a similar structure.

## Diagram
Please check the diagram in azure_iac.png

## Prerequisites
1. Install terraform based on OS - https://developer.hashicorp.com/terraform/downloads
2. Install azure cli  - https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
3. Refer code from https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account.html#network_rules

## Steps to run this code
1. az login --tenant tenant_id
2. az account set --subscription subscription_id
3. terraform init
4. terraform plan
5. terraform apply

Certainly! In the context of Microsoft Azure, both `tenant_id` and `subscription_id` are essential identifiers, but they represent different levels of scoping and are used for different purposes. Here's a deeper dive into each:

### 1. Tenant ID (Directory ID):
- **Definition**: The `tenant_id` (often also called the Directory ID) represents the organization in Azure Active Directory (Azure AD). It's a unique identifier for the Azure AD instance where you have your user account, roles, groups, and other Azure AD-specific configurations. Every Azure AD instance has a unique tenant ID.
  
- **Analog**: Think of Azure AD as the 'authentication universe' for your organization. The `tenant_id` is like the unique address or identifier for that universe.
  
- **Usage**: It's used in contexts where authentication, access, and identity features are relevant. For instance, when you're setting up integrations that require Azure AD for authentication (like logging into the Azure Portal, setting up service principals, or using Azure DevOps), you'll often need the `tenant_id`.

### 2. Subscription ID:
- **Definition**: The `subscription_id` is an identifier for a logical unit of Azure services. When you sign up for Azure, you get an Azure subscription which provides you access to Azure services. A single Azure AD tenant can have multiple Azure subscriptions associated with it. Each subscription has its unique ID.
  
- **Analog**: Think of Azure as a large department store where you can purchase various services (like VMs, databases, etc.). Your `subscription_id` is like your customer account in that store. You can have more than one account (subscription) in the store, and each account gets billed separately for the services/products (Azure resources) you use.
  
- **Usage**: When you're provisioning resources, monitoring consumption, or managing billing in Azure, you'll be working at the subscription level. The `subscription_id` is used to identify which subscription (and thus, which billing entity) you want a resource to belong to or pull data from.

### In Summary:
- **tenant_id (Directory ID)**: Identifies your organization's Azure AD instance. Think of it as your organization's Azure "authentication universe" ID.
  
- **subscription_id**: Identifies a specific set of resources and their billing setup in Azure. It's the account you "buy" Azure resources with.

It's important to note that while every subscription is associated with a single tenant, each tenant can be associated with multiple subscriptions.

