# Use official Node.js runtime as base image
FROM node:18-alpine

# Install curl for healthchecks
RUN apk add --no-cache curl

# Set working directory in container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Set environment variable for port
ENV PORT=3000

# Start the application
CMD ["npm", "start"]
