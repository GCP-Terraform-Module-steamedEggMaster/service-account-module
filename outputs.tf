# 리소스 ID 출력
output "id" {
  description = "서비스 계정의 리소스 ID"
  value       = google_service_account.service_account.id
}

# 서비스 계정 이메일 출력
output "email" {
  description = "서비스 계정의 이메일"
  value       = google_service_account.service_account.email
}

# 서비스 계정 이름 출력
output "name" {
  description = "서비스 계정의 전체 이름"
  value       = google_service_account.service_account.name
}

# 서비스 계정 고유 ID 출력
output "unique_id" {
  description = "서비스 계정의 고유 ID"
  value       = google_service_account.service_account.unique_id
}

# IAM 멤버 형식의 ID 출력
output "member" {
  description = "IAM 멤버 형식의 서비스 계정 ID"
  value       = google_service_account.service_account.member
}