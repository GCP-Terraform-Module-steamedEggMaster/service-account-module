variable "account_id" {
  description = "서비스 계정의 고유 ID (6-30자, RFC1035 규칙에 맞아야 함)"
  type        = string
}

variable "display_name" {
  description = "서비스 계정의 표시 이름 (Optional)"
  type        = string
  default     = null
}

variable "description" {
  description = "서비스 계정의 설명 (Optional)"
  type        = string
  default     = null
}

variable "disabled" {
  description = "서비스 계정의 활성화 여부 (Optional, 기본값: false)"
  type        = bool
  default     = false
}

variable "project" {
  description = "서비스 계정이 생성될 GCP 프로젝트 ID (Optional, 기본값: provider 프로젝트)"
  type        = string
  default     = null
}