#!/bin/bash
 
if test -f /sys/kernel/mm/transparent_hugepage/enabled; then
   echo never > /sys/kernel/mm/transparent_hugepage/enabled
fi
if test -f /sys/kernel/mm/transparent_hugepage/defrag; then
   echo never > /sys/kernel/mm/transparent_hugepage/defrag
fi

apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A

echo "deb http://repo.percona.com/apt wheezy main" >> /etc/apt/sources.list
echo "deb-src http://repo.percona.com/apt wheezy main" >> /etc/apt/sources.list

apt-get update

export DEBIAN_FRONTEND=noninteractive
apt-get install percona-server-tokudb-5.6 -y

mysql -e "INSTALL PLUGIN tokudb SONAME 'ha_tokudb.so';"
mysql -e "INSTALL PLUGIN tokudb_file_map SONAME 'ha_tokudb.so';"
mysql -e "INSTALL PLUGIN tokudb_fractal_tree_info SONAME 'ha_tokudb.so';"
mysql -e "INSTALL PLUGIN tokudb_fractal_tree_block_map SONAME 'ha_tokudb.so';"
mysql -e "INSTALL PLUGIN tokudb_trx SONAME 'ha_tokudb.so';"
mysql -e "INSTALL PLUGIN tokudb_locks SONAME 'ha_tokudb.so';"
mysql -e "INSTALL PLUGIN tokudb_lock_waits SONAME 'ha_tokudb.so';"
