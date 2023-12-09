keytool -genkey -alias localhost -keyalg RSA -keysize 2048 -dname "CN=localhost" -keypass host@123 -keystore ./data/ssl/localhost-keystore.jks -storepass host@123

keytool -export -alias localhost -keystore ./data/ssl/localhost-keystore.jks -rfc -file ./data/ssl/localhost.crt -storepass host@123

keytool -import -noprompt -alias localhost -file ./data/ssl/localhost.crt -keystore ./data/ssl/localhost-truststore.jks -storepass host@123