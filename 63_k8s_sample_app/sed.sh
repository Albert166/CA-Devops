sed -i.bak -e '596,604d' ./v2_7_1_full.yaml
sed -i.bak -e 's|your-cluster-name|albert-self-mng-bottlerocket|' ./v2_7_1_full.yaml