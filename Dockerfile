FROM golang:1.17-alpine3.15
WORKDIR /app
COPY . .

# strip additional debug information from
RUN go build -ldflags '-w -s -extldflags "-static"' -a -o application main.go

FROM scratch            
# using scratch image

WORKDIR /app
COPY --from=0 /app ./
CMD ["./application"]