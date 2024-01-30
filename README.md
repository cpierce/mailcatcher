# Docker MailCatcher

[MailCatcher](https://mailcatcher.me/) is a simple tool that captures and displays emails sent by your development applications. When integrated with Docker, a platform for developing, shipping, and running applications, MailCatcher becomes even more powerful and versatile. Here are some key reasons why you would want to use MailCatcher as a Docker container:

## Why Mailcatcher and Docker

### 1. Environment Consistency
- **Isolation:** Docker containers provide an isolated environment for MailCatcher, ensuring that it works consistently across different development setups.
- **Reproducibility:** By using Docker, you can create a MailCatcher container that behaves the same way regardless of where it's deployed, eliminating the "it works on my machine" problem.

### 2. Easy Integration and Configuration
- **Simplicity:** Integrating MailCatcher into your development workflow is easier with Docker. You can start the service with a simple Docker command without worrying about the installation process on the host machine.
- **Configuration:** Docker allows you to define and manage configurations for MailCatcher in a `Dockerfile` or a `docker-compose.yml` file, simplifying the process of adjusting settings.

### 3. Portability
- **Cross-platform Compatibility:** Docker containers can run on any platform that supports Docker, making MailCatcher easily portable between different operating systems and environments.
- **Development and Testing:** This portability is particularly useful for testing your application's email functionality in different environments.

### 4. Resource Efficiency
- **Lightweight:** Docker containers share the host system's kernel and are more lightweight compared to running separate virtual machines for each service.
- **Resource Management:** Docker allows for better management of system resources, as you can allocate specific amounts of memory and CPU to your MailCatcher container.

### 5. Easy to Scale and Maintain
- **Scalability:** In a containerized environment, scaling MailCatcher across multiple instances (if required) becomes more manageable.
- **Maintenance:** Updating MailCatcher is as simple as pulling a new image and restarting the container, ensuring you always have the latest version with minimal downtime.

### Conclusion
Using MailCatcher as a Docker container offers significant advantages in terms of consistency, ease of integration, portability, resource efficiency, and maintainability. It simplifies the process of capturing and testing emails in development environments, making it an ideal choice for modern application development.

## Ports Used by MailCatcher in Docker

When running MailCatcher within a Docker container, two main ports are utilized:

1. **SMTP Port (1025):**
   - **Purpose:** This is the port where MailCatcher listens for incoming email messages sent by your application.
   - **Details:** Your application’s SMTP settings should be configured to send emails to this port. Since port 25 (the standard SMTP port) often requires higher privileges, using port 1025 in development avoids such restrictions.

2. **Web Interface Port (1080):**
   - **Purpose:** This port is used to access the MailCatcher web interface.
   - **Details:** By accessing this port through a web browser, you can view the emails captured by MailCatcher. It provides a convenient way to inspect the email content, HTML structure, and other details.

## Docker Configuration Example

In your `docker-compose.yml` file, you might have a configuration similar to the following to expose these ports:

```yaml
services:
  mailcatcher:
    image: chrislpierce/mailcatcher
    ports:
      - "1080:1080" # Web interface
      - "1025:1025" # SMTP server
```

## Testing SMTP with `nc`

### Prerequisites
- Ensure MailCatcher is running and listening on port 1025.
- Have `nc` (Netcat) installed on your machine (alternatively you can use `telnet`)

## Sending an Email

### Step 1: Connect to MailCatcher's SMTP Server
Open your terminal and connect to the SMTP server:
```bash
nc localhost 1025
HELO localhost
MAIL FROM:<sender@example.com>
RCPT TO:<recipient@example.com>
DATA
Subject: Test Email

This is a test from mailcatcher.
.
QUIT
```

This should send a sample email for you.  Once this is done you should be able to see the email (regardless of whom you sent it to by visiting:
[http://localhost:1080](http://localhost:1080).

## Configuration

To configure an application to send using the settings desired for mailcatcher use the following settings:

```bash
SERVICE_TYPE = "SMTP"
SERVICE_HOST = "localhost"
SERVICE_PORT = 1025
SERVICE_USER = ""
SERVICE_PASS = ""
```

This configuration can be used for any language (php, ruby, javascript, or even your favorite email client for testing).
