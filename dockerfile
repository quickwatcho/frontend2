FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json . 
RUN npm install 
COPY . . 
RUN npm run build 


FROM nginx
# all static html files will be under /usr/share/nginx/html
COPY --from=builder  /app/build /usr/share/nginx/html

