FROM ubuntu:latest

RUN apt-get update && apt-get install -y alsa-base alsa-utils screen alsa mpg123 ffmpeg

# Add ALSA loopback
RUN modprobe snd-aloop pcm_substreams=1

# Add .asoundrc configuration
RUN echo 'pcm.!default { type plug slave.pcm "hw:Loopback,0,0" }' > ~/.asoundrc


WORKDIR /app

COPY . /app

