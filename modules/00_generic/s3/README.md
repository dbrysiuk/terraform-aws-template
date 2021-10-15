### Description

Terraform module to create secure s3 buckets.

### Requirements

No requirements.

### Providers

| Name | Version |
|------|---------|
| aws | n/a |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | Name of bucket you want to create | `any` | n/a | yes |
| enable\_lifecycle | Enable Bucket lifecycle policy | `bool` | `false` | no |
| expire\_after\_days | If bucket lifecycle policy is enabled, then the objects inside bucket will be deleted after these many days | `number` | `365` | no |
| force\_destroy | Allow bucket destruction even if the bucket has objects | `bool` | `false` | no |
| key\_id | Alternative to kms\_key mentioned above. KMS Key ID used to ecrypt the bucket. Please provide either this OR kms\_key mentioned above. | `string` | `""` | no |
| kms\_key | KMS Key Alias used to encrypt the bucket | `string` | `"otrp-key"` | no |
| versioning | Enable bucket versioning | `bool` | `false` | no |

### Outputs

| Name | Description |
|------|-------------|
| arn | Bucket ARN |
| bucket | Bucket Name |
| bucket\_domain\_name | Bucket Domain Name |
| id | Bucket ID |