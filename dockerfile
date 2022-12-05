From node:alpine
RUN mkdir /react
COPY . /react
CMD ["node" "/react/package.json"]
