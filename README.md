# terraform-azurerm-app-service

[![Build Status](https://github.com/JamesWoolfenden/terraform-azurerm-app-service/workflows/Verify/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-azurerm-app-service)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-azurerm-app-service.svg)](https://github.com/JamesWoolfenden/terraform-azurerm-app-service/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-azurerm-app-service.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-azurerm-app-service/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-azurerm-app-service/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-azurerm-app-service&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-azurerm-app-service/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-azurerm-app-service&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module -

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

This is just a very basic example.

Include **module.linuxvm.tf** this repository as a module in your existing terraform code:

```terraform
module "app-service" {
  source              = "JamesWoolfenden/app-service/azurerm"
  common_tags         = var.common_tags
  resource_group_name = var.resource_group_name
  disk_name           = var.disk_name
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | n/a | `string` | `"adminuser"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | This is to help you add tags to your cloud objects | `map(any)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"pike"` | no |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | n/a | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | n/a | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | (optional) describe your variable | `string` | `"Standard_B1ls"` | no |
| <a name="input_source_image_reference"></a> [source\_image\_reference](#input\_source\_image\_reference) | n/a | <pre>object({<br>    publisher = string<br>    offer     = string<br>    sku       = string<br>    version   = string<br>  })</pre> | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

This is the policy required to build this project:

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang

resource "azurerm_role_definition" "terraform_pike" {
  role_definition_id = local.uuid
  name               = "terraform_pike"
  scope              = data.azurerm_subscription.primary.id

  permissions {
    actions = [
    "Microsoft.Compute/disks/delete",
    "Microsoft.Compute/disks/read",
    "Microsoft.Compute/virtualMachines/delete",
    "Microsoft.Compute/virtualMachines/powerOff/action",
    "Microsoft.Compute/virtualMachines/read",
    "Microsoft.Compute/virtualMachines/write",
    "Microsoft.Network/networkInterfaces/delete",
    "Microsoft.Network/networkInterfaces/join/action",
    "Microsoft.Network/networkInterfaces/read",
    "Microsoft.Network/networkInterfaces/write",
    "Microsoft.Network/virtualNetworks/subnets/join/action",
    "Microsoft.Network/virtualNetworks/subnets/read",
    "Microsoft.Resources/subscriptions/resourcegroups/read"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}

locals {
  uuid = uuid()
}

data "azurerm_subscription" "primary" {
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-azurerm-app-service/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-azurerm-app-service/issues) to report any bugs or file feature requests.

## Copyrights

Copyright � 2022-23 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
