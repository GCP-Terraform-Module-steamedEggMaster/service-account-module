resource "google_service_account" "service_account" {
  # 필수 옵션
  account_id = var.account_id # 서비스 계정 ID (6-30자, RFC1035 규칙에 맞아야 함)

  # 선택 옵션
  display_name                 = var.display_name                 # 서비스 계정 표시 이름 (Optional)
  description                  = var.description                  # 서비스 계정 설명 (Optional)
  disabled                     = var.disabled                     # 서비스 계정 비활성화 여부 (Optional, 기본값: false)
}