#! /bin/sh
echo "Welcome to MaintainerrJSONBin"
cp /opt/config/app.config /opt/app/.env
cd /opt/app
npm install
npm start