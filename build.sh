
image_name="172.18.0.2:5000/myapp"

docker build -t $image_name .

docker run --name myapp -p 8181:8181 -it -d $image_name