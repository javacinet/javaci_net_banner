#!/bin/bash

# Commit sayısını belirle
NUM_COMMITS=800

# Başlangıç tarihi olarak bu ayın ilk günü belirle ve bir önceki aya ayarla
START_DATE=$(date -v1d -v-1m +"%Y-%m-01")

# Tarih formatını düzenle
DATE_FORMAT=$(date -j -f "%Y-%m-%d" "$START_DATE" +"%a %b %d %H:%M:%S %Y %z")

# Geçici bir dosya oluştur ve 100 commit yap
for i in $(seq 701 $NUM_COMMITS)
do
  echo "Commit #$i" > temp_file.txt
  git add temp_file.txt
  GIT_COMMITTER_DATE="$DATE_FORMAT" git commit -m "Commit #$i" --date="$DATE_FORMAT"

  # Bir önceki commit için tarihi bir ay geriye al
  START_DATE=$(date -v1d -v-${i}m +"%Y-%m-01")
  DATE_FORMAT=$(date -j -f "%Y-%m-%d" "$START_DATE" +"%a %b %d %H:%M:%S %Y %z")
done

# Geçici dosyayı sil
rm temp_file.txt