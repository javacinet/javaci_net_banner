#!/bin/bash

# Commit sayısını belirle
NUM_COMMITS=100

# Geçici bir dosya oluştur ve 100 commit yap
for i in $(seq 1 $NUM_COMMITS)
do
  echo "Commit #$i" > temp_file.txt
  git add temp_file.txt
  git commit -m "Commit #$i"
done

# Geçici dosyayı sil
rm temp_file.txt