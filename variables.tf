variable "namespace" {
  description = "The namespace where the CronJob will be deployed"
  type        = string
  default     = "default"
}

variable "cronjob_name" {
  description = "The name of the CronJob"
  type        = string
  required = true
}

variable "concurrency_policy" {
  description = "The concurrency policy for the CronJob"
  type        = string
  default     = "Allow"
}

variable "failed_jobs_history_limit" {
  description = "The number of failed job history to retain"
  type        = number
  default     = 10
}

variable "schedule" {
  description = "The schedule for the CronJob"
  type        = string
  required = true
}

variable "timezone" {
  description = "The timezone for the CronJob"
  type        = string
  default     = "UTC"
}

variable "starting_deadline_seconds" {
  description = "The deadline in seconds for starting the job"
  type        = number
  default     = 30
}

variable "backoff_limit" {
  description = "The number of retries before giving up"
  type        = number
  default     = 2
}

variable "ttl_seconds_after_finished" {
  description = "Time to live in seconds after the job completes"
  type        = number
  default     = 3600
}

variable "container_image" {
  description = "The container image for the CronJob"
  type        = string
  required = true
}

variable "labels" {
  description = "Labels to attach to the CronJob"
  type        = map(string)
  default     = {}
}
