```sh
# install dependent packages by yum
sudo yum install libXScrnSaver-devel libXau-devel libXcomposite-devel \
 libXcursor-devel libXdamage-devel libXext-devel libXfixes-devel libXft-devel \
 libXi-devel libXinerama-devel libXpm-devel libXrandr-devel libXrender-devel \
 libXt-devel libXv-devel libXtst-devel readline-devel libX11 libX11-devel libXt \
 libXt-devel cairo xorg-x11-server-Xvfb

# install dependent packages(currently gengetopt only) from source
wget ftp://ftp.gnu.org/gnu/gengetopt/gengetopt-2.22.6.tar.gz
tar xf gengetopt-2.22.6.tar.gz 
pushd gengetopt-2.22.6
./configure 
make
sudo make install
popd

# install R version 3.0.2 from source
wget http://cran.md.tsukuba.ac.jp/src/base/R-3/R-3.0.2.tar.gz
tar xf R-3.0.2.tar.gz 
cd R-3.0.2
./configure --prefix=/usr/local/ --with-x --with-libpng --with-jpeglib
make
sudo make install

# how to execute for generating a benchmark result with basho_bench
cd ${basho_bench_root_dir}
xvfb-run make results
```
