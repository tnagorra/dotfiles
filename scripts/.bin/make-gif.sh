duration=7

palette="/tmp/palette.png"

filters="fps=10,scale=1200:-1:flags=lanczos"

ffmpeg -v warning -t $duration -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -t $duration -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
