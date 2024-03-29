# MJF_ERP


## Summary
#### 조직의 최적의 성능을 위해 핵심 업무 프로세스를 자동화해 통합적으로 연계 및 관리할 수 있는 ERP 시스템을 가상의 가구 회사를 만들어 구현해 보았습니다.
#### ERP 시스템은 회사의 재무, 공급, 운영, 상거래, 보고, 제조, 인사, 영업 활동이 단일 플랫폼에 연결되어 있지만 이 프로젝트는 영업 관리 프로세스에 중점을 두었습니다.
#### eclipse 환경에서 apache 서버를 활용하여 jsp 페이지를 동작하게 하고, aws에 있는 Database 서버를 활용하여 물품 재고, 수주, 매출 등을 관리하였습니다.

## Background
#### 이 프로젝트는 가구 회사의 ERP 시스템 중 영업 관리 부분을 구현하는 것입니다. 따라서 복잡하고 다양한 품목을 단순하게 관리해야 하고, 수주 후 단계별 진행 상황을 쉽게 파악할 수 있어야 합니다. 또한 영업사원이 언제 어디서든 재고 및 실적을 확인할 수 있고, 영업조직별 매출에 대한 목표와 실적, 분석이 가능해야 합니다.
#### 때문에 계급마다 다른 권한을 부여하여 볼 수 있는 컨텐츠가 다르도록 구현하도록 하여 관리자가 로그인하면 사원별, 물건별, 거래처별로 매출 현황을 확인할 수 있도록 할 것입니다. 가시적으로 매출을 파악할 수 있도록 그래프를 활용하여 통계적 지표 또한 나타낼 것입니다.

## Development
기준정보
![캡4](https://user-images.githubusercontent.com/84059942/230771710-8eeeff5f-cfe9-4b9b-934d-7d01cb65fec3.png)
거래처
![캡9](https://user-images.githubusercontent.com/84059942/230771689-7941b011-b084-42ee-9f1d-86d1a7427b48.png)
재고
![캡3](https://user-images.githubusercontent.com/84059942/230771767-0a2724cc-d067-4e01-aad8-ba9f4f2cee39.png)
수주
![캡5](https://user-images.githubusercontent.com/84059942/230771803-73c44904-63f2-45b6-be2c-54f22a40af24.png)
![캡7](https://user-images.githubusercontent.com/84059942/230771808-022ffc7f-ca6d-45aa-b9cc-2925564598b8.png)
매출
![캡8](https://user-images.githubusercontent.com/84059942/230771823-07dc8f5c-b5e2-4e25-83ab-c66ead464dc1.png)
![캡6](https://user-images.githubusercontent.com/84059942/230771829-666cead3-0f79-4118-935e-3e5e96e66cd1.png)

#### 1. 로그인 및 메인 화면
  - 직급에 따른 로그인 권한 부여
  - 월 매출과 가장 매출이 높은 품목을 띄우는 메인 화면 구현
#### 2. 기준 정보 관리
  - 기준 정보 수정 및 삭제
  - 영업 사원 등록 및 계정 생성
  - 새로운 품목 등록
#### 3. 거래처 관리
  - 새로운 거래처 등록
  - 기존 거래처 정보 및 거래 여부 변경
#### 4. 재고 관리
  - 생산된 품목을 창고에 등록
  - 불량 재고의 관리 및 재활용 여부 결정
#### 5. 수주 관리
  - 수주 등록 시 단가 입력 및 수정 가능
  - 수주 목록 조회에서 진행 상황 확인
#### 6. 매출 관리
  - 매출 등록 및 예외 출고 등록
  - 거래 명세서, 세금 계산서 발급


## Result
#### 기업이 직접 사용하고 있는 전사적 자원 관리(ERP) 시스템을 자세히 알아볼 수 있었던 계기가 되었습니다.
#### 그 중에서도 수주 등록부터 매출 관리까지 구현하였고, 그 밖에도 재고와 거래처, 영업사원 관리 페이지를 만들면서 기업의 영업이 어떤 방식으로 이루어 지는지 알게 되었습니다.
#### 매출 혹은 수주 상황을 사원별, 품목별, 거래처별로 보기좋게 나열하는 것이 기업의 영업 관리자 관점에서는 가장 필요로 하지만 가장 구현하기 어려운 부분이었습니다. 따라서 검색 기능을 세부화하려고 노력했고 그래프를 사용하여 가시적으로 표현하려고 하였습니다.


## Technology Stack
#### Frontend : html, css
#### Backend : java, php
#### server : apache, aws
#### Database : SQL
#### IDE : eclipse
