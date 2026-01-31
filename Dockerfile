
# --------------------------------------------------------------------------------
# STAGE 1: BUILDER
# Uses a lean Node image to install dependencies and compile the React app
# --------------------------------------------------------------------------------
FROM node:lts-alpine AS builder

# Define a build argument for the version (default to 'unknown' if not provided)
ARG BUILD_VERSION=unknown

WORKDIR /app

# Copy package files first to enable caching of npm install
COPY package*.json ./
RUN npm install

# Copy application source code
COPY . .

# Pass the BUILD_VERSION as an environment variable during the build
# This value will be baked into the static assets (e.g., accessible via process.env.REACT_APP_VERSION)
# **HIGHLIGHTED APP BUILD/MR CODE**
RUN REACT_APP_VERSION=${BUILD_VERSION} npm run build

# --------------------------------------------------------------------------------
# STAGE 2: FINAL PRODUCTION IMAGE
# Uses a minimal Nginx image to serve the compiled static files
# --------------------------------------------------------------------------------
FROM nginx:alpine

# Copy the built React application files from the 'builder' stage
# This step discards the entire Node.js environment, reducing size by >90%
COPY --from=builder /app/build /usr/share/nginx/html

# Expose the standard HTTP port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
