# 🚀 Optimized React + Nginx Docker Image
This repository contains a high-performance, production-ready Docker configuration for React applications. It utilizes a multi-stage build to ensure the final image is minimal, secure, and ready for cloud deployment.

## 🛠 Features
-   **Multi-Stage Build:** Reduces final image size by >90% by discarding the Node.js build environment.
-   **Version Injection:** Uses ARG BUILD_VERSION to bake version metadata directly into the React app.
-   **Security:** Uses alpine variants for both Node and Nginx to minimize the attack surface.
-   **Performance:** Pre-configured to serve static assets via Nginx.

## Getting Started

You can build and run this application using Docker.

### Prerequisites

-   [Docker](https://docs.docker.com/get-docker/) installed on your machine.

### Build the Docker Image

1.  Clone this repository:
    ```bash
    git clone <repository-url>
    cd frontend-docker
    ```

2.  Build the Docker image:
    ```bash
    docker build -t frontend-app .
    ```
    You can also pass a version number during the build process:
    ```bash
    docker build --build-arg BUILD_VERSION=1.0.0 -t frontend-app .
    ```

### Run the Docker Container

1.  Run the container, mapping a local port (e.g., 8080) to the container's port 80:
    ```bash
    docker run -d -p 8080:80 --name my-frontend-app frontend-app
    ```

2.  Open your web browser and navigate to `http://localhost:8080` to see the application running.

## Local Development (Inferred)

For local development without Docker, you would typically follow these steps. (Note: This assumes a standard `create-react-app` or similar setup. The `package.json` file is the definitive source for these commands).

1.  **Install Dependencies:**
    ```bash
    npm install
    ```

2.  **Start the Development Server:**
    ```bash
    npm start
    ```

3.  **Build for Production:**
    ```bash
    npm run build
    ```
