- This image is build on Linux2



docker build . -t tableau_image

docker run --name tableau_container -it tableau_image  /bin/bash
