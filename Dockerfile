FROM node:26.7.0

RUN  apt-get update \
     && apt-get install -y wget gnupg ca-certificates \
     && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/googlechrome-keyring.gpg \
     && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
     && apt-get update \
     && apt-get install -y \
      google-chrome-stable \
      fonts-ipafont-gothic \
      fonts-wqy-zenhei \
      fonts-thai-tlwg \
      fonts-freefont-ttf \
      libxss1 \
      libxshmfence1 \
      libglu1 \
       --no-install-recommends \
     && rm -rf /var/lib/apt/lists/*

RUN curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
