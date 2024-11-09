# Start from an official image for the required programming language
FROM node:18-alpine  # Use a smaller base image for Node.js (replace '18' with your version if different)

# Set working directory
WORKDIR /app

# Copy package files separately to leverage Docker caching for dependencies
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps  # Use --legacy-peer-deps if dependency conflicts are possible

# Copy the rest of the application files
COPY . .

# Set environment variables (use as needed)
ENV NODE_ENV=production

# Expose port (if applicable for your application)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]

# Troubleshooting/Optimizations:
# - Ensuring the smallest base image reduces vulnerabilities and build size.
# - Copying `package.json` separately allows Docker to cache npm install, which speeds up builds.
# - Using `npm install --legacy-peer-deps` can resolve peer dependency conflicts if relevant.
