#!/usr/bin/env bash
WORKER_NUM=$1
PROCESS_NUM=`expr $WORKER_NUM + 1`
echo $PROCESS_NUM
hostname > mpi_host_file
$(which mpirun) -np $PROCESS_NUM  --allow-run-as-root \

##  SOLVE the bug: "ModuleNotFoundError: No module named 'fedml.simulation.mpi.async_fedavg' "  my environment is google colab
!cp -r /content/drive/MyDrive/FedML/python/fedml/simulation/mpi/async_fedavg  /usr/local/lib/python3.7/dist-packages/fedml/simulation/mpi/
python3 main_fedml_object_detection.py --cf config/simulation/fedml_config.yaml
