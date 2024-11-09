# Use Node.js as the base image
FROM node:18-alpine

# Install wrangler CLI
RUN npm install -g wrangler

# Create and set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy all worker files
COPY . .

# Set wrangler as the default entrypoint
CMD ["wrangler", "dev"]
