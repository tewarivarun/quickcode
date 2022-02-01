#!/bin/zsh

for (( i=10; i<=245; i++ ))
do
echo "conn tenant-1-10$i"
echo "    leftsubnet=172.10.$i.0/29"
echo "    leftid=tenant.1.10$i"
echo ""
ip addr add  172.10.$i.2/29 dev lo
done

# 200 IPSec Connections
for (( i=10; i<=210; i++ ))
do
echo "conn tenant-1-20$i"
echo "    leftsubnet=172.20.$i.0/29"
echo "    leftid=tenant.1.20$i"
echo ""
ip addr add  172.20.$i.2/29 dev lo
done

# 200 IPSec Connections
for (( i=10; i<=210; i++ ))
do
echo "conn tenant-1-30$i"
echo "    leftsubnet=172.30.$i.0/29"
echo "    leftid=tenant.1.30$i"
echo ""
ip addr add  172.30.$i.2/29 dev lo
done

# 200 IPSec Connections
for (( i=10; i<=210; i++ ))
do
echo "conn tenant-1-40$i"
echo "    leftsubnet=172.40.$i.0/29"
echo "    leftid=tenant.1.40$i"
echo ""
ip addr add  172.40.$i.2/29 dev lo
done

# 200 IPSec Connections
for (( i=10; i<=210; i++ ))
do
echo "conn tenant-1-50$i"
echo "    leftsubnet=172.50.$i.0/29"
echo "    leftid=tenant.1.50$i"
echo ""
ip addr add  172.50.$i.2/29 dev lo
done

# 200 IPSec Connections
for (( i=10; i<=210; i++ ))
do
echo "conn tenant-1-60$i"
echo "    leftsubnet=172.60.$i.0/29"
echo "    leftid=tenant.1.60$i"
echo ""
ip addr add  172.60.$i.2/29 dev lo
done
