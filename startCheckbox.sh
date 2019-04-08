echo "Start Nginx"
/etc/init.d/nginx start 
cd checkbox.io/server-side/site
echo "Set Environment Variables..."
echo "Mongo User" 
export MONGO_USER=admin
echo "Mongo Password" 
export MONGO_PASSWORD=admin
echo "Mongo port" 
export MONGO_PORT=3002
echo "Monog IP" 
export MONGO_IP=localhost
echo "Mongo Mail User" 
export MAIL_USER=admin
echo  "Mongo Mail Password" 
export MAIL_PASSWORD=admin 
echo "Mongo SMTP"
export MAIL_SMTP=smtp.gmail.com 
echo "Starting server.js"
node server.js
