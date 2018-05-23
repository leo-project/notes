cd /tmp/package/leo_manager_1
./bin/leo_manager stop
cp etc/leo_manager.conf /tmp/package_131/leo_manager_1/etc/
cp -r log work /tmp/package_131/leo_manager_1/
cd ..
mv leo_manager_1/ leo_manager_1_bak
cp -r /tmp/package_131/leo_manager_1 .
./leo_manager_1/bin/leo_manager start
