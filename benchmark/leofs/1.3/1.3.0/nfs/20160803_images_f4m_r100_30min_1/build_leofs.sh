#!/bin/bash

git clone https://github.com/leo-project/leofs.git
cd leofs

#git checkout develop
#./rebar get-deps
#(cd deps/leo_storage; git checkout develop)
#(cd deps/leo_gateway; git checkout develop)
#(cd deps/leo_manager; git checkout develop)
#(cd deps/leo_object_storage; git checkout develop)
#(cd deps/leo_redundant_manager; git checkout develop)
#(cd deps/leo_s3_libs; git checkout leofs-1.2)
#./rebar get-deps

#git checkout 1.2.10
#./rebar get-deps

git checkout 1.4
./rebar get-deps
(cd deps/leo_gateway; git checkout 1.4)
(cd deps/leo_manager; git checkout 1.4)
(cd deps/leo_storage; git checkout 1.4)
(cd deps/leo_object_storage; git checkout 1.4)
(cd deps/leo_cache; git checkout 1.4)
(cd deps/leo_redundant_manager; git checkout develop)
(cd deps/cowboy; git checkout for-leofs-1.4)
(cd deps/leo_s3_libs; git checkout develop)
(cd deps/leo_erasure; git checkout develop)
./rebar get-deps

make
make release
