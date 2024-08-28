#!/bin/bash

# Commit sayısını belirle
NUM_COMMITS=300

# Başlangıç tarihi olarak bu ayın ilk günü belirle ve bir önceki aya ayarla
START_DATE=$(date -v1d -v-1m +"%Y-%m-01")

# Geçici bir dosya oluştur ve 100 commit yap
for i in $(seq 201 $NUM_COMMITS)
do
  echo "Commit #$i" > temp_file.txt
  git add temp_file.txt
  GIT_COMMITTER_DATE="$START_DATE" git commit -m "Commit #$i" --date="$START_DATE"
  
  # Bir önceki commit için tarihi bir ay geriye al
  START_DATE=$(date -v1d -v-${i}m +"%Y-%m-01")
done

# Geçici dosyayı sil
rm temp_file.txt