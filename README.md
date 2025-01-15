# service-account-module
GCP Terraform service account module Repo

GCP에서 **서비스 계정(Service Account)**을 생성하고 관리하기 위한 Terraform 모듈입니다. <br>
이 모듈은 서비스 계정을 쉽고 유연하게 구성하도록 설계되었습니다.

<br>

## 📑 **목차**
1. [모듈 특징](#모듈-특징)
2. [사용 방법](#사용-방법)
    1. [사전 준비](#1-사전-준비)
    2. [입력 변수](#2-입력-변수)
    3. [모듈 호출 예시](#3-모듈-호출-예시)
    4. [출력값 (Outputs)](#4-출력값-outputs)
    5. [지원 버전](#5-지원-버전)
    6. [모듈 개발 및 관리](#6-모듈-개발-및-관리)
3. [테스트](#terratest를-이용한-테스트)
4. [주요 버전 관리](#주요-버전-관리)
5. [기여](#기여-contributing)
6. [라이선스](#라이선스-license)

---

## 모듈 특징

- Google Cloud 프로젝트에 서비스 계정을 생성.
- 서비스 계정 표시 이름 및 설명 설정.
- 서비스 계정 비활성화 여부 설정.
- 중복 서비스 계정 생성 무시 옵션 제공.
- IAM 역할을 추가적으로 부여 가능.
- 생성된 서비스 계정의 주요 속성 출력.

---

## 사용 방법

### 1. 사전 준비

다음 사항을 확인하세요:
1. Google Cloud 프로젝트 준비.
2. 적절한 IAM 권한 필요: `roles/iam.serviceAccountAdmin`

<br>

### 2. 입력 변수

| 변수명                       | 타입   | 필수 여부 | 기본값   | 설명                                            |
|------------------------------|--------|-----------|----------|-------------------------------------------------|
| `account_id`                | string | ✅        | 없음     | 서비스 계정의 고유 ID (6-30자, RFC1035 규칙 준수) |
| `display_name`              | string | ❌        | `null`   | 서비스 계정의 표시 이름                        |
| `description`               | string | ❌        | `null`   | 서비스 계정의 설명                              |
| `disabled`                  | bool   | ❌        | `false`  | 서비스 계정 비활성화 여부                      |
| `project`                   | string | ❌        | `null`   | 서비스 계정이 생성될 GCP 프로젝트 ID - 미설정 시 Provider 제공 정보 사용   |
| `create_ignore_already_exists` | bool | ❌        | `false`  | 중복된 서비스 계정 생성 시 무시 여부            |

<br>

### 3. 모듈 호출 예시

```hcl
module "service_account" {
  source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/service-account-module.git?ref=v1.0.0"

  account_id                   = "my-service-account"
  display_name                 = "My Service Account"
  description                  = "Service account for testing purposes"
  disabled                     = false
  project                      = "your-gcp-project-id"
  create_ignore_already_exists = true
}
```

<br>

### 4. 출력값 (Outputs)

| 출력명      | 설명                                  |
|-------------|---------------------------------------|
| `id`        | 서비스 계정의 리소스 ID               |
| `email`     | 서비스 계정의 이메일                  |
| `name`      | 서비스 계정의 전체 이름               |
| `unique_id` | 서비스 계정의 고유 ID                 |
| `member`    | IAM 멤버 형식의 서비스 계정 ID         |

<br>

### 5. 지원 버전

#### a.  Terraform 버전
| 버전 범위 | 설명                              |
|-----------|-----------------------------------|
| `1.10.3`   | 최신 버전, 지원 및 테스트 완료                  |

#### b. Google Provider 버전
| 버전 범위 | 설명                              |
|-----------|-----------------------------------|
| `~> 6.0`  | 최소 지원 버전                   |

<br>

### 6. 모듈 개발 및 관리

- **저장소 구조**:
  ```
  service-account-module/
  ├── .github/workflows/  # github actions 자동화 테스트
  ├── examples/           # 테스트를 위한 루트 모듈 모음 디렉터리
  ├── test/               # 테스트 구성 디렉터리
  ├── main.tf             # 모듈의 핵심 구현
  ├── variables.tf        # 입력 변수 정의
  ├── outputs.tf          # 출력 정의
  ├── versions.tf         # 버전 정의
  ├── README.md           # 문서화 파일
  ```
<br>

---

## Terratest를 이용한 테스트
이 모듈을 테스트하려면 제공된 Go 기반 테스트 프레임워크를 사용하세요. 아래를 확인하세요:

1. Terraform 및 Go 설치.
2. 필요한 환경 변수 설정 (GCP_PROJECT_ID, API_SERVICES 등).
3. 테스트 실행:
```bash
go test -v ./test
```

<br>

## 주요 버전 관리
이 모듈은 [Semantic Versioning](https://semver.org/)을 따릅니다.  
안정된 버전을 사용하려면 `?ref=<version>`을 활용하세요:

```hcl
source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/service-account-module.git?ref=v1.0.0"
```

### Module ref 버전
| Major | Minor | Patch |
|-----------|-----------|----------|
| `1.0.0`   |    |   |


<br>

## 기여 (Contributing)
기여를 환영합니다! 버그 제보 및 기능 요청은 GitHub Issues를 통해 제출해주세요.

<br>

## 라이선스 (License)
[MIT License](LICENSE)