# GCP Cloud Function (in GO)

```sh
go mod init example.com/gcf
go mod tidy

go get go.uber.org/zap
go get cloud.google.com/go/logging

GOOS=linux GOARCH=amd64 go build -o main .

zip function.zip main go.mod go.sum

```
