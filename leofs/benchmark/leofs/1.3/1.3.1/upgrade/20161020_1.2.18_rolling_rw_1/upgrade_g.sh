cd /tmp/package/leo_gateway
./bin/leo_gateway stop
cp etc/leo_gateway.conf /tmp/package_131/leo_gateway/etc/
cp -r log work /tmp/package_131/leo_gateway/
cd ..
mv leo_gateway/ leo_gateway_bak
cp -r /tmp/package_131/leo_gateway .
./leo_gateway/bin/leo_gateway start
