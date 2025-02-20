module "service_account" {
  source = "../../" # 모듈 경로를 설정하세요

  # 필수 변수 설정
  account_id = "test-service-account"

  # 선택적 변수 설정
  display_name                 = "Test Service Account"                                  # 서비스 계정의 표시 이름
  description                  = "This is a service account for demonstration purposes." # 서비스 계정 설명
  disabled                     = false                                                   # 서비스 계정 비활성화 여부
  create_ignore_already_exists = true                                                    # 이미 존재하는 경우 무시
}