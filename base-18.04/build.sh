# for VER in "10.1" "10.2" "11.0" "11.1" "11.2.1" "11.3.0"; do echo build $VER
for VER in "10.2"; do echo build $VER
docker build -t cacao4ao/base-18.04:$VER --build-arg CUDA=$VER .
done
docker tag cacao4ao/base-18.04:$VER cacao4ao/base-18.04:latest

# to start the image:
# docker run --gpus all -it --rm cacao4ao/base-18.04:10.2