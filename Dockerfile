FROM ubuntu:xenial

RUN addgroup signal && \
    useradd signal -g signal -m -s /bin/bash && \
    usermod -a -G audio,video signal && \
    apt-get update && apt-get install -y wget apt-transport-https && \
    wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg && \
    cat signal-desktop-keyring.gpg | tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null && \
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | tee -a /etc/apt/sources.list.d/signal-xenial.list && \
    apt-get update && apt-get -y install signal-desktop && \
    chmod 4755 /opt/Signal/chrome-sandbox && \
    rm -rf /var/lib/apt/lists/* 
    
USER signal
CMD signal-desktop --no-sandbox

