# -------------------------------------------------------------------
# Minimal dockerfile from alpine base
#
# Instructions:
# =============
# 1. Create an empty directory and copy this file into it.
#
# 2. Create image with:
#       docker build --tag timeoff:latest .
#
# 3. Run with:
#       docker run -d -p 3000:3000 --name alpine_timeoff timeoff
#
# 4. Login to running container (to update config (vi config/app.json):
#       docker exec -ti --user root alpine_timeoff /bin/sh
# --------------------------------------------------------------------
# Use a Node.js base image

FROM node:14

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first to leverage Docker caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy remaining application files
COPY . .

# Expose port
EXPOSE 3000

# Set environment variables if necessary
# ENV NODE_ENV=dev

# Command to run the application
CMD ["npm", "start"]
