# 1단계: 빌드 환경
FROM node:18 AS build-stage

# 작성자 정보
LABEL authors="leekangmin"

# 작업 디렉토리 생성 및 설정
WORKDIR /app

# package.json과 package-lock.json 복사
COPY package*.json ./

# 의존성 설치
RUN npm install

# Vue 소스 코드 전체 복사
COPY . .

# 프로덕션 빌드 실행
RUN npm run build

# 2단계: 배포 환경
FROM nginx:alpine AS production-stage

# 작성자 정보
LABEL authors="leekangmin"

# Nginx 기본 설정 파일을 수정해 포트 설정 (옵션)
# 커스텀 Nginx 설정 파일 적용 (포트와 SPA 설정 가능)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 빌드 결과물 복사
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Nginx 포트를 3000으로 변경
EXPOSE 3000

# Nginx 실행
CMD ["nginx", "-g", "daemon off;"]
