#This is a dockerfile to create a simple application with Node.js app
FROM node:18
WORKDIR /app
ENV CUSTOM_TEXT="This works"
ENV ENVIRONMENT="Does it work?"
COPY ./nodejs /app 
EXPOSE 3000
CMD ["app.js"]

