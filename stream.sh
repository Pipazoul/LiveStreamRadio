#!/bin/bash

# Define variables
RTMP_URL=
STREAM_KEY=
MUSIC_PATH=media/music
VIDEO_PATH=media/sample_background.mkv

# Shuffle the music files and feed them into the while loop
ls "$MUSIC_PATH"/*.mp3 | shuf | while IFS= read -r MUSIC_FILE
do
    # Extract music file name
    MUSIC_NAME=$(basename "$MUSIC_FILE" .mp3)

    # Stream the video with music overlay and text
    ffmpeg \
    -stream_loop -1 -i "$VIDEO_PATH" \
    -i "$MUSIC_FILE" \
    -filter_complex "[0:v]drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='$MUSIC_NAME':fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5:boxborderw=5:\
    x=(w-text_w)/2:y=(h-text_h)/2,format=yuv420p[v]" \
    -map "[v]" -map 1:a -s 640x360 -r 30 -c:v libx264 -b:v 500k -c:a aac -strict experimental -b:a 192k -ar 44100 \
    -f flv "$RTMP_URL/$STREAM_KEY"

    # Sleep for the duration of the music track
    sleep $(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$MUSIC_FILE")
done