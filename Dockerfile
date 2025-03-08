# Use Node.js 18 as base image
FROM node:18.20.7-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm install

# Copy all project files
COPY . .

# Build the application
RUN npm run build

# Expose the required port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
