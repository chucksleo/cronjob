# cronjob
This folder contains reusable Terraform module for a cronjob in Kubernetes

# Terraform Kubernetes CronJob Module

This Terraform module deploys a Kubernetes CronJob with customizable configurations.

## Usage

```hcl
module "kubernetes_cronjob" {
  source = "../.."  # Use the appropriate source path

  namespace                 = var.namespace
  cronjob_name              = var.cronjob_name
  concurrency_policy        = var.concurrency_policy
  failed_jobs_history_limit = var.failed_jobs_history_limit
  schedule                  = var.schedule
  timezone                  = var.timezone
  starting_deadline_seconds = var.starting_deadline_seconds
  backoff_limit              = var.backoff_limit
  ttl_seconds_after_finished = var.ttl_seconds_after_finished
  container_image  = var.container_image
  labels = {
    app     = "my-app"
    version = "1.0"
  }
}
```

 Name      | Version   |
|-----------|-----------|
| terraform | >= 0.15.5 |
| aws       | >= 3.62   |

## Resources

| Name                                                                                                                     | Type     |
|--------------------------------------------------------------------------------------------------------------------------|----------|
| [kubernetes_cronjob](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cron_jobt)       | resource |

## Inputs

| Name                       | Type       | Required  | Description                                     | Default    |
|----------------------------|------------|-----------|-------------------------------------------------|------------|
| namespace                  | string     |    yes    | The namespace where the CronJob will be deployed|  "default" |
| cronjob_name               | string     |           | The name of the CronJob	                        |            |
| concurrency_policy         | string     |           | The container port to expose                    |            |
| failed_jobs_history_limit	 | number     |           |   The number of failed job history to retain	  |  "Allow"   |
| schedule                   | string     |           | The schedule for the CronJob	                  |            |
| timezone                   | string     |           | The timezone for the CronJob	                  |  "UTC"     |
| starting_deadline_seconds  | number     |           | The deadline in seconds for starting the job	  |  30        |
| backoff_limit              | number     |           | The number of retries before giving up	        |  2         |
| ttl_seconds_after_finished | number     |           | Time to live in seconds after the job completes |  3000      |
| container_image            | string     |           | The name of the service                         |            |
| labels                     | map(string)|    yes    | Standard metadata of the resource to be annoted |     {}     |

## Outputs

| Name           | Description                         |
|----------------|-------------------------------------|
| cronjob_name   | The name of the deployed CronJob    |


