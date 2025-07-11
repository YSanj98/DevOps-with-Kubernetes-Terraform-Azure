# AKS Kubernetes Deployment

This project provides a set of Kubernetes manifests and scripts to deploy a WordPress application with a MySQL backend on Azure Kubernetes Service (AKS).

## Project Structure

- **manifests/**: Contains Kubernetes resource definitions.
  - **namespace.yaml**: Defines the Kubernetes namespace for the application.
  - **mysql-secret.yaml**: Contains sensitive information for MySQL, such as the root password.
  - **mysql-pvc.yaml**: Defines a PersistentVolumeClaim for MySQL data storage.
  - **wordpress-pvc.yaml**: Defines a PersistentVolumeClaim for WordPress data storage.
  - **mysql-deployment.yaml**: Deployment configuration for the MySQL database.
  - **wordpress-deployment.yaml**: Deployment configuration for the WordPress application.
  - **wordpress-service.yaml**: Service definition for accessing WordPress.
  - **network-policy.yaml**: Defines network policies for pod communication.
  - **wordpress-ingress.yaml**: Ingress resource for external access to WordPress.

- **scripts/**: Contains deployment scripts.
  - **deploy.sh**: Shell script to automate the deployment of Kubernetes resources.

## Prerequisites

- Azure account with permissions to create resources.
- Azure CLI installed and configured.
- Helm installed for managing Kubernetes applications.
- kubectl installed for interacting with the Kubernetes cluster.

## Deployment Instructions

1. **Create an AKS Cluster**: Follow the Azure CLI commands to create a resource group and an AKS cluster.
2. **Get AKS Credentials**: Use `az aks get-credentials` to configure kubectl to use the new AKS cluster.
3. **Deploy Resources**: Run the deployment script:
   ```bash
   ./scripts/deploy.sh
   ```
4. **Access WordPress**: Set up DNS to point your domain to the static public IP reserved for the Ingress controller.

## Cleanup

To remove the deployed resources, you can delete the namespace and the AKS cluster using the appropriate kubectl and Azure CLI commands.

## License

This project is licensed under the MIT License.