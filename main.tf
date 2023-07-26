resource "kubernetes_cron_job" "my_cronjob" {
  metadata {
    name      = var.cronjob_name
    namespace = var.namespace
    labels    = var.labels
  }

  spec {
    concurrency_policy = var.concurrency_policy
    failed_jobs_history_limit = var.failed_jobs_history_limit
    schedule          = var.schedule
    timezone = var.timezone
    starting_deadline_seconds = var.starting_deadline_seconds
    job_template {
      metadata {
        labels = var.labels
      }
      spec {
        backoff_limit = var.backoff_limit
        ttl_seconds_after_finished = var.ttl_seconds_after_finished
        template {
          metadata {
            labels = var.labels
          }
          spec {
            container {
              name  = var.cronjob_name
              image = var.container_image
              command = ["/bin/sh", "-c", "date; echo Hello from the Kubernetes cluster"]
              # Additional container configurations can be added here if needed
            }
          }
        }
      }
    }
  }
}

# Set the Kubernetes resource type for CronJob
locals {
  api_version = "batch/v1beta1"
  kind        = "CronJob"
}

