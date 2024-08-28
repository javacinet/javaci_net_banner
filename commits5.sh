#!/bin/bash

# Commit sayısını belirle
NUM_COMMITS=20

# Başlangıç tarihi olarak bu ayın ilk günü belirle ve bir önceki aya ayarla
START_DATE=$(date -v1d -v-1m +"%Y-%m-01")

# Geçici bir dosya oluştur ve 100 commit yap
for i in $(seq 11 $NUM_COMMITS)
do
  echo "Commit #$i" > temp_file.txt
  git add temp_file.txt
  git commit -m "Commit #$i"

  # Tarihleri güncelle ve commit'i düzenle
  GIT_COMMITTER_DATE="Wed Jan 10 14:00 2024 +0100" git commit --amend --date="$START_DATE" --no-edit

  # Bir önceki commit için tarihi bir ay geriye al
  START_DATE=$(date -v1d -v-${i}m +"%Y-%m-01")
done

# Geçici dosyayı sil
rm temp_file.txt