#set env vars
set -o allexport; source .env; set +o allexport;

echo "Waiting for MeshCentral ot be ready"
sleep 10s;

app_target=$(docker-compose port app 8086)

#create admin user
curl --insecure https://$app_target \
  -H 'content-type: application/x-www-form-urlencoded' \
  --data-raw 'action=createaccount&username='"$ADMIN_LOGIN"'&email='"$ADMIN_EMAIL"'&password1='"$ADMIN_PASSWORD"'&password2='"$ADMIN_PASSWORD"'&apasswordhint=&anewaccountpass=&anewaccountcaptcha=&urlargs=&captchaargs=' \
  --compressed

#change config
NEW_CONTENT=$(jq '.settings.IgnoreAgentHashCheck = true' ./data/config.json)
echo -E "${NEW_CONTENT}" > ./data/config.json

#set uniq sessionKey
SESSION_KEY=$(openssl rand -hex 20)
NEW_CONTENT=$(jq ".settings._sessionKey = \"$SESSION_KEY\"" ./data/config.json)
echo -E "${NEW_CONTENT}" > ./data/config.json

#restart stack
docker-compose restart

echo "Install finished"