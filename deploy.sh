docker build -t kn0rr/multi-k8s-client:latest -t kn0rr/multi-k8s-client:$SHA -f ./client/Dockerfile ./client
docker build -t kn0rr/multi-k8s-server:latest -t kn0rr/multi-k8s-server:$SHA -f ./server/Dockerfile ./server
docker build -t kn0rr/multi-k8s-worker:latest -t kn0rr/multi-k8s-worker:$SHA -f ./worker/Dockerfile ./worker
docker push kn0rr/multi-k8s-client:latest
docker push kn0rr/multi-k8s-client:$SHA
docker push kn0rr/multi-k8s-server:latest
docker push kn0rr/multi-k8s-server:$SHA
docker push kn0rr/multi-k8s-worker:latest
docker push kn0rr/multi-k8s-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=kn0rr/multi-k8s-server:$SHA
kubectl set image deployments/server-deployment client=kn0rr/multi-k8s-client:$SHA
kubectl set image deployments/server-deployment worker=kn0rr/multi-k8s-worker:$SHA