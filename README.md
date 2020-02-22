you need to have GOPATH and GOBIN set to class path already.

It may be useful to have multiple Go versions installed on the same machine, for example, to ensure that a package's tests pass on multiple Go versions. Once you have one Go version installed, you can install another (such as 1.10.7) as follows:

$ go get golang.org/dl/go1.10.7
$ go1.10.7 download
The newly downloaded version can be used like go:

$ go1.10.7 version
go version go1.10.7 linux/amd64


# Usage
```
./switch go1.13.1
```
