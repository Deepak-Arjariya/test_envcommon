resource "null_resource" "compliances" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = "chmod +x arg.sh"
  }

  provisioner "local-exec" {
    command = "bash arg.sh ${var.print}"
  }
}


variable "print" {
  type = string
}
# resource "null_resource" "compliances" {
#   for_each = local.compliance
#   triggers = {
#     always_run = "${timestamp()}"
#   }
#   provisioner "local-exec" {
#     interpreter = ["/bin/bash", "-c"]
#     command     = "chmod +x ${path.module}/${each.value["script_name"]}.sh"
#   }

#   provisioner "local-exec" {
#     command = "${path.module}/${each.value["script_name"]}.sh ${each.value["arguments"]}"
#   }
# }



# variable "compliance_details" {
#   description = "compliance rule to remediate"
#   type = map(object({
#     script_name = string
#     #script name from scripts folder to execute
#     execute = bool
#     # flag to specify whether to execute the script or not
#     arguments = string
#     # extra arguments to pass to the scripts
#   }))
#   # default = {}
#   default = {
#     enable_ecs_cluster_insights = {
#       script_name = "arg"
#       execute     = true
#       arguments   = ""
#     },
#     instance_metadata_service = {
#       script_name = "arg"
#       execute     = true
#       arguments   = ""
#     },
#     enable_dynamodb_pitr = {
#       script_name = "arg"
#       execute     = true
#       arguments   = ""
#     },
#     enable_s3_versioning = {
#       script_name = "arg"
#       execute     = true
#       arguments   = ""
#     },
#     attach_lambda_vpc = {
#       script_name = "arg"
#       execute     = true
#       arguments   = "Alloo bindi Mirchi"
#     },
#     modify_log_group_retention = {
#       script_name = "arg"
#       execute     = true
#       arguments   = ""
#     }
#   }
# }

# variable "suppress_security_hub_rule" {
#   description = "suppress security hub rule on specific resource"
#   type = any
#   # default = null
#   default = []
#   # default = [
#   #   {
#   #     "rule_detail": {"Id": "arn:aws:securityhub:us-west-1:123456789012:subscription/pci-dss/v/3.2.1/PCI.Lambda.2/finding/a1b2c3d4-5678-90ab-cdef-EXAMPLE11111", "ProductArn": "arn:aws:securityhub:us-west-1::product/aws/securityhub"}
#   #     "note": {"Text": "Known issue that is not a risk.", "UpdatedBy": "user1"}
#   #     "severity": {"Label": "LOW"}
#   #     "workflow": {"Status": "RESOLVED"}
#   #   },
#   #   {
#   #     "rule_detail": {"Id": "kdfiefiefiefst-1:123456789012:subscription/pci-dss/v/3.2.1/PCI.Lambda.2/finding/a1b2c3d4-5678-90ab-cdef-EXAMPLE11111", "ProductArn": "arn:aws:securityhub:us-west-1::product/aws/securityhub"}
#   #     "note": {"Text": "fjdfkjefke a risk.", "UpdatedBy": "user1"}
#   #     "severity": {"Label": "LOW"}
#   #     "workflow": {"Status": "RESOLVED"}
#   #   }
#   # ]
# }
locals {
    arg1 = jsonencode([{"Id": "arn:aws:securityhub:us-west-1:123456789012:subscription/pci-dss/v/3.2.1/PCI.Lambda.2/finding/a1b2c3d4-5678-90ab-cdef-EXAMPLE11111", "ProductArn": "arn:aws:securityhub:us-west-1::product/aws/securityhub"}, {"Id": "arn:aws:securityhub:us-west-1:123456789012:subscription/pci-dss/v/3.2.1/PCI.Lambda.2/finding/a1b2c3d4-5678-90ab-cdef-EXAMPLE22222", "ProductArn": "arn:aws:securityhub:us-west-1::product/aws/securityhub"}])
    arg2 = jsonencode({"Text": "Known issue that is not a risk.", "UpdatedBy": "user1"})
    arg3 = jsonencode({"Label": "LOW"})
    arg4 =  jsonencode({"Status": "RESOLVED"})
    # arg3 = "Aryan"
    # arg4 = "'{\"Status\": \"RESOLVED\"}' '{\"Label\": \"LOW\"}'"
    # arg5 = ""
    arg6 = "'${local.arg1}' '${local.arg2}' '${local.arg3}' '${local.arg4}'"

  #   suppress_security_hub_rule = distinct(flatten([for rules in var.suppress_security_hub_rule: {
  #   rule_detail = jsonencode(rules.rule_detail)
  #   note = jsonencode(rules.note)
  #   severity = jsonencode(rules.severity)
  #   workflow = jsonencode(rules.workflow)
  # }
  # ]))

  # suppress_security_hub_rule_arguments = flatten([for rules in local.suppress_security_hub_rule: "'${rules.rule_detail}' '${rules.note}' '${rules.severity}' '${rules.workflow}'"])

  # security_hub_rule_details = {
  #   for idx, suppress_rule_argument in local.suppress_security_hub_rule_arguments: idx => {
  #     script_name = "suppress_security_hub_resource_rule"
  #     execute = true
  #     arguments = suppress_rule_argument
  #   } 
  # }

  # compliances = {
  #   for k, v in var.compliance_details : k => v
  #   if v.execute == true
  # }

  # compliance = merge(local.compliances, local.security_hub_rule_details)
}

# output "rule_detail" {
#   value = local.compliances
# }



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This module contains null resources which perform the following tasks :
#   - Enable ECS Cluster Insights for all existing clusters
#   - Set the default ECS Cluster Insights setting to enabled
#
#   - Enable Instance Metadata Service
#   - Set the Instance Metadata Servive v2 (IMDSv2) to Required
#
#   - Enable DynamoDB PITR (Point In Time Recovery) for terraform-locks
#
#   - Enable versioning for s3 buckets
#
#   - Attach subnets and security group to Lambda Function
#
#   - Set CloudWatch Log Group Retention to 365 days
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This module contains null resources which perform the following tasks :
#   - Enable ECS Cluster Insights for all existing clusters
#   - Set the default ECS Cluster Insights setting to enabled
#
#   - Enable Instance Metadata Service
#   - Set the Instance Metadata Servive v2 (IMDSv2) to Required
#
#   - Enable DynamoDB PITR (Point In Time Recovery) for terraform-locks
#
#   - Enable versioning for s3 buckets
#
#   - Attach subnets and security group to Lambda Function
#
#   - Set CloudWatch Log Group Retention to 365 days
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# terraform {
#   # This module is now only being tested with Terraform 1.1.x. However, to make upgrading easier, we are setting 1.0.0 as the minimum version.
#   required_version = ">= 1.0.0"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 3.75.1"
#     }
#     null = {
#       source = "hashicorp/null"
#     }
#   }
# }

# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # Store the objects with parameter execute as true in compliance
# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# locals {
#   suppress_security_hub_rule = distinct(flatten([for rules in var.suppress_security_hub_rule : {
#     rule_detail = jsonencode(rules.rule_detail)
#     note        = jsonencode(rules.note)
#     severity    = jsonencode(rules.severity)
#     workflow    = jsonencode(rules.workflow)
#     }
#   ]))

#   suppress_security_hub_rule_arguments = flatten([for rules in local.suppress_security_hub_rule : "'${rules.rule_detail}' '${rules.note}' '${rules.severity}' '${rules.workflow}'"])

#   security_hub_rule_compliances = {
#     for idx, suppress_rule_argument in local.suppress_security_hub_rule_arguments : idx => {
#       script_name = "suppress_security_hub_rule"
#       execute     = true
#       arguments   = suppress_rule_argument
#     }
#   }

#   script_compliances = {
#     for k, v in var.compliance_details : k => v
#     if v.execute == true
#   }

#   compliance = merge(local.script_compliances, local.security_hub_rule_compliances)
# }

# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # Run corresponding commands for each object in compliance
# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# resource "null_resource" "compliances" {
#   for_each = local.compliance
#   triggers = {
#     always_run = "${timestamp()}"
#   }
#   provisioner "local-exec" {
#     interpreter = ["/bin/bash", "-c"]
#     command     = "chmod +x ${path.module}/${each.value["script_name"]}.sh"
#   }

#   provisioner "local-exec" {
#     command = "${path.module}/${each.value["script_name"]}.sh ${each.value["arguments"]}"
#   }
# }

# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # The following compliance_details variable includes:
# #   - script_name - Name of script to be run for each compliance/null resource
# #   - execute     - whether the command is to be run
# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# variable "compliance_details" {
#   description = "compliance rule to remediate"
#   type = map(object({
#     script_name = string
#     #script name from scripts folder to execute
#     execute = bool
#     # flag to specify whether to execute the script or not
#     arguments = string
#     # extra arguments to pass to the scripts
#   }))
#   default = {
#     enable_ecs_cluster_insights = {
#       script_name = "arg"
#       execute     = true
#       arguments   = ""
#     },
#     instance_metadata_service = {
#       script_name = "arg"
#       execute     = true
#       arguments   = ""
#     },
#     enable_dynamodb_pitr = {
#       script_name = "arg"
#       execute     = true
#       arguments   = ""
#     },
#     enable_s3_versioning = {
#       script_name = "arg"
#       execute     = true
#       arguments   = ""
#     },
#     attach_lambda_vpc = {
#       script_name = "arg"
#       execute     = true
#       arguments   = "allo bhinfi mirchi"
#     },
#     modify_log_group_retention = {
#       script_name = "arg"
#       execute     = true
#       arguments   = ""
#     }
#   }
# }

# variable "suppress_security_hub_rule" {
#   description = "suppress security hub rule on specific resource"
#   type        = any
#   # default     = []
#   default =  [
#     {
#       "rule_detail": {"Id": "arn:aws:securityhub:us-west-1:123456789012:subscription/pci-dss/v/3.2.1/PCI.Lambda.2/finding/a1b2c3d4-5678-90ab-cdef-EXAMPLE11111", "ProductArn": "arn:aws:securityhub:us-west-1::product/aws/securityhub"}
#       "note": {"Text": "Known issue that is not a risk.", "UpdatedBy": "user1"}
#       "severity": {"Label": "LOW"}
#       "workflow": {"Status": "RESOLVED"}
#     },
#   ]
#   # [
#   #   {
#   #     "rule_detail": {"Id": "arn:aws:securityhub:us-west-1:123456789012:subscription/pci-dss/v/3.2.1/PCI.Lambda.2/finding/a1b2c3d4-5678-90ab-cdef-EXAMPLE11111", "ProductArn": "arn:aws:securityhub:us-west-1::product/aws/securityhub"}
#   #     "note": {"Text": "Known issue that is not a risk.", "UpdatedBy": "user1"}
#   #     "severity": {"Label": "LOW"}
#   #     "workflow": {"Status": "RESOLVED"}
#   #   },
#   # ]
# }