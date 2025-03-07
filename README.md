# Docker MailCatcher

[MailCatcher](https://mailcatcher.me/) is a simple tool that captures and displays emails sent by your development applications. When integrated with Docker, a platform for developing, shipping, and running applications, MailCatcher becomes even more powerful and versatile. Here are some key reasons why you would want to use MailCatcher as a Docker container:

## Why Use MailCatcher with Docker

### 1. Environment Consistency

- **Isolation:** Docker provides an isolated environment for MailCatcher, ensuring it works consistently across different development setups.
- **Reproducibility:** Using Docker eliminates the "it works on my machine" problem, allowing the MailCatcher container to behave identically across different environments.

### 2. Easy Integration and Configuration

- **Simplicity:** Running MailCatcher with Docker requires only a simple command, avoiding manual installation on the host machine.
- **Configuration Management:** Define settings in a `Dockerfile` or `docker-compose.yml` to simplify MailCatcher configuration.

### 3. Portability

- **Cross-Platform Compatibility:** Docker allows MailCatcher to run consistently across different operating systems.
- **Flexible Testing:** Easily test email functionality in different environments without additional setup.

### 4. Resource Efficiency

- **Lightweight:** Docker containers share the host system's kernel, making them more efficient than running separate virtual machines.
- **Resource Management:** Allocate specific CPU and memory to the MailCatcher container for optimized performance.

### 5. Scalability and Maintenance

- **Scalability:** Containerization makes scaling MailCatcher easier if multiple instances are needed.
- **Simple Updates:** Updating MailCatcher is as easy as pulling a new image and restarting the container.

### Conclusion

Running MailCatcher in a Docker container ensures consistency, ease of integration, portability, efficiency, and maintainability. It simplifies capturing and testing emails in development environments, making it a valuable tool for modern application development.

## Coniguration and Technical Details

### MailCatcher Ports in Docker

MailCatcher uses two main ports when running in a Docker container:

#### 1. **SMTP Port (1025)**
   - **Purpose:** Listens for incoming emails from your application.
   - **Usage:** Configure your application's SMTP settings to use this port. Using port 1025 avoids permission issues associated with port 25.

#### 2. **Web Interface Port (1080)**
   - **Purpose:** Provides a web interface to view captured emails.
   - **Usage:** Open `http://localhost:1080` in your browser to inspect email content, including HTML and text versions.

### Docker Configuration Example

To run MailCatcher with Docker, use the following `docker-compose.yml` configuration:

```yaml
services:
  mailcatcher:
    image: chrislpierce/mailcatcher
    ports:
      - "1080:1080" # Web interface
      - "1025:1025" # SMTP server
```

## Sending an Email

### Prerequisites

- Ensure MailCatcher is running and listening on port 1025.
- Have `nc` (Netcat) installed on your machine (alternatively you can use `telnet`)

### Steps to Send an Email

#### Step 1: Connect to MailCatcher's SMTP Server

Open your terminal and connect to the SMTP server:

```bash
nc localhost 1025
```

#### Step 2: Send an Email

Enter the following commands to send an email:

```bash
HELO localhost
MAIL FROM:<sender@example.com>
RCPT TO:<recipient@example.com>
DATA
Subject: Test Email

This is a test message.
.
QUIT
```

#### Step 3: View the Email

Now that you've sent an email, visit [http://localhost:1080](http://localhost:1080) in your browser to view the email in MailCatcher's web interface.

### Configuring Your Application to Use MailCatcher

To configure your application to send emails via MailCatcher, use the following settings:

```bash
SERVICE_TYPE = "SMTP"
SERVICE_HOST = "localhost"
SERVICE_PORT = 1025
SERVICE_USER = ""
SERVICE_PASS = ""
```

This configuration works for various programming languages, including PHP, Ruby, JavaScript, and even email clients for testing.

By using MailCatcher with Docker, you can streamline your email testing process and ensure that your application's email functionality works as expected in a consistent and reproducible environment.