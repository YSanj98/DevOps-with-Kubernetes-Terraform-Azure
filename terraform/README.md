# Azure Infrastructure-as-Code (IaC) with Terraform

This repository provides a modular and scalable infrastructure-as-code (IaC) solution for deploying Azure resources using Terraform. It is organized for clarity, reusability, and ease of use.

## Directory Structure

```
terraform/
  infrastructure/
    azure/         # Azure Terraform root configs (main.tf, variables.tf, etc.)
  modules/
    azure/
      aks/                  # Azure Kubernetes Service (AKS) module
      application_insights/ # Application Insights module
      app_service/          # App Service module
      app_service_plan/     # App Service Plan module
      gateway/              # Application Gateway module
      gateway_public_ip/    # Gateway Public IP module
      gateway_subnet/       # Gateway Subnet module
      resource_group/       # Resource Group module
      security_group/       # Network Security Group (NSG) module
      sql_db/               # Azure SQL Database module
      subnet/               # Subnet module
      vnet/                 # Virtual Network module
```

## Getting Started

1. **Install Terraform:**

   - [Terraform Download](https://www.terraform.io/downloads.html)

2. **Install Azure CLI:**

   - [Azure CLI Download](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

3. **Authenticate with Azure:**

   - Run `az login` to authenticate your Azure account.

4. **Configure Variables:**

   - Edit `terraform.tfvars` in `infrastructure/azure/` to set environment-specific values.

5. **Initialize and Apply:**
   - Navigate to `terraform/infrastructure/azure/`.
   - Run `terraform init` to initialize the working directory.
   - Run `terraform plan` to review the execution plan.
   - Run `terraform apply` to provision resources.

## Azure Modules

Reusable modules for Azure are located in `modules/azure/`:

- **aks/**: Azure Kubernetes Service (AKS) cluster
- **application_insights/**: Application Insights monitoring
- **app_service/**: Azure App Service for web apps
- **app_service_plan/**: App Service Plan (scaling/pricing tier)
- **gateway/**: Application Gateway
- **gateway_public_ip/**: Public IP for Gateway
- **gateway_subnet/**: Subnet for Gateway
- **resource_group/**: Resource Group
- **security_group/**: Network Security Group (NSG)
- **sql_db/**: Azure SQL Database
- **subnet/**: Subnet for VNet
- **vnet/**: Virtual Network

Each module has its own README with usage instructions, input variables, and outputs.
