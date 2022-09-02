# LiveStreamRadio
Lightweight 24/7 Twitch and YouTube Music Radio using FFMPEG.

## Dependencies
Install the following software on your machine: *screen*, *alsa*, *mpg123* and *ffmpeg*
```bash
sudo apt install screen alsa mpg123 ffmpeg
```

## Installation
Clone this repository
```bash
git clone https://github.com/NoniDOTio/LiveStreamRadio.git
```

## How To Use
- Open `config.sh` in an editor and add your RTMP urls to *PLATFORMS*, remove any lines you don't need 
```bash
PLATFORMS=(
    "rtmp://a.rtmp.youtube.com/live2/1234-5678-90ab-cdef-ghij"
)
```
- Specify a file path for `MUSIC_DIR=` and `BACKGROUND=`. Alternatively, you can move all your audio files to `/media/music`.
- Start streaming by launching the script
```bash
./lsr.sh --start
```
- Stop streaming by quitting the script
```bash
./lsr.sh --stop
```
