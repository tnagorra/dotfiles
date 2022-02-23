rm -f noise.prof
rm -f noise.wav
rm -f song.wav
rm -f song-clean.wav

# Extract audio
ffmpeg -i "Fuzzy Feeling - YouTube [360p].mp4" song.wav
# Extract noise
ffmpeg -i "Fuzzy Feeling - YouTube [360p].mp4" -vn -ss 00:00:00 -t 00:00:03 noise.wav
# Create noise profile
sox noise.wav -n noiseprof noise.prof
# Create cleaned-audio
sox song.wav song-clean.wav noisered noise.prof 0.25
