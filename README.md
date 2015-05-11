### Packaging

zip tsukaby-apps-docker-`date +"%Y-%m-%d-%H:%M:%S"` -r \
  ./eb/.* \
  ./eb/*

### Deploy

eb create prod-apps-common --cfg prod-apps-common-sc --region ap-northeast-1 --cname tsukaby-apps
