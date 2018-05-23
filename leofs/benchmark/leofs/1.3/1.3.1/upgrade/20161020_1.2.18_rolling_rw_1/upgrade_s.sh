cd /tmp/package/leo_storage
./bin/leo_storage stop
cp etc/leo_storage.conf /tmp/package_131/leo_storage/etc/
cp -r log work /tmp/package_131/leo_storage/
cd ..
mv leo_storage/ leo_storage_bak
cp -r /tmp/package_131/leo_storage .
./leo_storage/bin/leo_storage start
