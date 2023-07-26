output "cronjob_name" {
  description = "The name of the deployed CronJob"
  value       = kubernetes_cron_job.my_cronjob.metadata[0].name
}
