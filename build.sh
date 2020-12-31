
DOCKER_NAME="172.18.0.2:5000/myapp"

DOCKER_IMAGE=`/usr/bin/docker images | grep ${DOCKER_NAME} | awk '{print $3}'`

if [ -n "${DOCKER_IMAGE}" ]; then
    # check docker container
    for dc in `/usr/bin/docker ps -a | grep ${DOCKER_NAME} | awk '{print $1}'`
    do
            echo "Stop container: ${dc}"
            /usr/bin/docker stop ${dc}
            # delete while docker container was exists
            echo "##Delete exists Container_Id: "${dc}
            /usr/bin/docker rm ${dc}
    done

    # delete while docker image was exists
    echo "#Delete exists Image: "${DOCKER_IMAGE}
    /usr/bin/docker rmi ${DOCKER_IMAGE}
fi

/usr/bin/docker build -t ${DOCKER_NAME} .

/usr/bin/docker run --name myapp -p 8181:8181 -it -d ${DOCKER_NAME}