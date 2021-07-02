# CACAO Docker

## To run it

```bash
run --gpus all -it --rm cacao4ao/base-18.04:10.2
```

user : cacao, pass: cacao

root pass: cacao

```bash
cacao@ed8860963c30:~$ milk
....        [ENABLED]  Code test point tracing
        milk  v 1.03.00
        === DEBUG MODE : assert() & DEBUG_TRACEPOINT  enabled ===
        ImageStreamIO v 1.04
        CLI PID = 16
        Cpus_allowed_list:      0-39
        Running with openMP 201511, max threads = 40  (OMP_NUM_THREADS)
        MILK_SHM_DIR '/milk/shm'
        Using SHM directory /milk/shm
        semaphore naming : /dev/shm/sem..milk.shm.<sname>_sem<xx>
        MILKCLI_ADD_LIBS not set -> no additional module loaded
        Loaded 4 modules, 107 commands
milk > quit
Closing PID 16 (prompt process)
milk > EXIT CODE 0
De-allocating test circular buffer
```

## To build to new version

```bash
cd base-18.04
./build.sh
```

### test locally

```bash
docker run --gpus all -it --rm -h cacao-docker cacao4ao/base-18.04:10.2
```

### push a new version

register to the docker hub organization : https://hub.docker.com/orgs/cacao4ao

```bash
docker login
docker push cacao4ao/base-18.04
```