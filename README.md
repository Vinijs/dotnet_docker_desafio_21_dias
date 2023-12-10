docker build -t app_docker_21_dias .

docker run -it --rm -p 5000:80 --name app_docker_21_dias app_docker_21_dias