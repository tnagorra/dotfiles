for file in $HOME/*.flv; do
    base=$(basename "$file")
    filename="${base%.*}"
    echo "Processing on \'$filename\'"

    ffmpeg -i "$file" -movflags faststart -profile:v baseline -level 3.1 "$filename.mp4"
done
