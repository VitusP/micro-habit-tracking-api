FROM python:3.12

# Create container user
RUN useradd -m -r -s /bin/bash ecscontaineruser

# Create user home directory
WORKDIR /home/ecscontaineruser

# Copy source file to the image work directory
COPY . .

# Install the requirements
RUN pip install -r requirements.txt

# Switch user
USER ecscontaineruser

# Expose port
EXPOSE 5000

# Entrypoint
ENTRYPOINT [ "python", "-m", "src.app" ]


