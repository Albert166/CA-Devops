docker build -t my-prometheus .
docker run -p 9090:9090 --network host --name prometheus my-prometheus
