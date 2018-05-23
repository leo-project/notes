cd /tmp/package/leo_manager_0
./bin/leo_manager stop
cp etc/leo_manager.conf /tmp/package_131/leo_manager_0/etc/
cp -r log work /tmp/package_131/leo_manager_0/
cd ..
mv leo_manager_0/ leo_manager_0_bak
cp -r /tmp/package_131/leo_manager_0 .
./leo_manager_0/bin/leo_manager start
