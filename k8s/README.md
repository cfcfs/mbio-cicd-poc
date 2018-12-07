# MB.io k8s Learning Cluster

Setting up MB.io cluster requires that you have `terraform` and `kubectl` installed:
---

1. Install `terraform` and `kubectl` using via homebrew

```
brew install terraform
brew install kubectl
```

2. Creating a *mbio* namespace in `terraform`

```
terraform workspace new mbio
```

3. Creating the k8s cluster

The current terraform script needs that some environment variables to be defined to run, you can pass the variables via command line or by editing the `variables.tf` script.

Here is how to run terraform using command line variables:

```
terraform apply \
 -var scaleway_organization=123e4567-e89b-12d3-a456-426655440000 \
 -var scaleway_access=e0b88fe5-2fd0-443d-8e42-731b1e92697a \
 -var scaleway_token=c0836f6b-f28e-4589-9d7a-62ef49b7cb85 \
 -var private_key=~/.ssh/id_rsa
```

If you edited the `variables.tf` script simply run

```
terraform apply
```

4. Destroying the cluster

```
terraform destroy -force
```
