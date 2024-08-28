#!/bin/bash

# Commit sayısını belirle
NUM_COMMITS=100

# Başlangıç tarihi olarak bu ayın ilk günü belirle ve bir önceki aya ayarla
START_DATE=$(date -v1d -v-1m +"%Y-%m-01")

# Geçici bir dosya oluştur ve 100 commit yap
for i in $(seq 1 $NUM_COMMITS)
do
  echo "Commit #$i" > temp_file.txt
  git add temp_file.txt
  git commit -m "Commit #$i"

  # Tarihi güncelle ve commiti düzenle
  git commit --amend --date="$START_DATE" --no-edit

  # Bir sonraki commit için tarihi bir ay ileri al
  START_DATE=$(date -v1d -v+${i}m +"%Y-%m-01")
done

# Geçici dosyayı sil
rm temp_file.txt