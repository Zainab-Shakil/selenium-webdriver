FROM python:3.8-slim

WORKDIR /app

# Install Chrome + dependencies
RUN apt update && apt install -y \
    wget \
    curl \
    unzip \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libnss3 \
    libxss1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install ./google-chrome-stable_current_amd64.deb -y \
    && rm google-chrome-stable_current_amd64.deb

# Install Python dependencies
RUN pip install selenium webdriver-manager --break-system-packages

# Copy script
COPY firsttest.py .

# Run script
CMD ["python", "firsttest.py"]
