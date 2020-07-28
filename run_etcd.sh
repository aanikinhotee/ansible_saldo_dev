sudo rm -rf /tmp/etcd-data.tmp && mkdir -p /tmp/etcd-data.tmp && \
  chmod 700 /tmp/etcd-data.tmp && docker rmi gcr.io/etcd-development/etcd:v3.4.10 || true && \
  docker run -d -p 2379:2379  -e ETCD_ENABLE_V2=true -p 2380:2380 \
  --mount type=bind,source=/tmp/etcd-data.tmp,destination=/etcd-data \
    --name etcd-gcr-v3.4.10   gcr.io/etcd-development/etcd:v3.4.10  \
     /usr/local/bin/etcd   --name s1   --data-dir /etcd-data  \
      --listen-client-urls http://0.0.0.0:2379  \
       --advertise-client-urls http://0.0.0.0:2379  \
        --listen-peer-urls http://0.0.0.0:2380  \
         --initial-advertise-peer-urls http://0.0.0.0:2380 \
           --initial-cluster s1=http://0.0.0.0:2380 \
             --initial-cluster-token tkn  \
              --initial-cluster-state new  \
               --log-level info   --logger zap \
                 --log-outputs stderr
