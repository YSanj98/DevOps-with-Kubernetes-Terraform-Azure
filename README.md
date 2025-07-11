# Kubernetes and Terraform Deployment for WordPress on Azure AKS

This project demonstrates a complete DevOps workflow for deploying a WordPress application with a MySQL backend on Azure Kubernetes Service (AKS), using Terraform for infrastructure provisioning and Kubernetes manifests for application deployment.

## Project Structure

- **aks-k8s-deployment/**: Contains Kubernetes manifests and deployment scripts for WordPress and MySQL on AKS.
  - `manifests/`: YAML files for Kubernetes resources (deployments, services, ingress, secrets, PVCs, etc.).
  - `scripts/`: Shell scripts for automating deployment tasks.
- **terraform/**: Infrastructure as Code (IaC) for provisioning Azure resources using Terraform.
  - `infrastructure/azure/`: Main Terraform configuration files for Azure resources.
  - `modules/azure/`: Reusable Terraform modules for different Azure components (AKS, App Service, VNet, etc.).

## Key Features

- **Modular Terraform**: Infrastructure is organized into reusable modules for scalability and maintainability.
- **Kubernetes Manifests**: Declarative YAML files for deploying and managing WordPress and MySQL workloads.
- **Azure Integration**: Provisions AKS, networking, databases, and monitoring resources on Azure.
- **DevOps Ready**: Designed for CI/CD and infrastructure automation.

## Getting Started

1. **Provision Infrastructure**
   - Navigate to `terraform/infrastructure/azure/` and initialize Terraform:
     ```bash
     terraform init
     terraform plan
     terraform apply
     ```
2. **Deploy Application**
   - Use the provided scripts and manifests in `aks-k8s-deployment/` to deploy WordPress and MySQL to the AKS cluster.

## Prerequisites

- Azure Subscription
- Terraform
- kubectl
- Bash shell (for scripts)

## Notes

- Sensitive files and state are excluded via `.gitignore`.
- See subdirectory `README.md` files for more details on each component.

## Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements or new modules.

## Future Improvements

- Multi cloud support: Extend the Terraform modules to support other cloud providers like AWS or GCP.
- Deploy on EKS, GKE, or other Kubernetes services.

## Author

**Yasindu Sanjeewa**

- GitHub: [YSanj98](https://github.com/YSanj98)
- LinkedIn: [yasindu_sanjeewa](https://www.linkedin.com/in/yasindu-sanjeewa-a79783202)
