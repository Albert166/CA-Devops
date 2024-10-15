# Best security practises for Azure

## Protecting Secrets
1. Conduct an audit to identify secrets
2. Avoid hardcoding secrets. Use environment variables for them also integrate secret retrieval into your automated deployment pipeline.
3. Use secure key store like Azure Key, Azure Managed HSM. For greater security consider encrypting secrets with Hardware Security Model (HSM).
4. Follow the principle of least privileged access.
5. Rotate secrets regularly. You can do that in Azure Key Vault.
6. Monitor and log access to your secrets. You can do that by using services such as Azure Monitor and Azure event grid.
7. Implement network isolation. Configure access and firewalls to allow access to secrets only for for fully trusted applications and services.
8. Encrypt secrets at vault and transit.

## Security best practises for databases
1. Use multifactor authentication
2. Impement principle of least privileged
3. Implement seperation of duties

