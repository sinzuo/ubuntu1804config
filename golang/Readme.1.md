//go:generate statik -src=./html/dist
//go:generate go fmt statik/statik.go
// 使用方法先go get -d github.com/rakyll/statik/fs
// statik -src=./html/dist && go fmt statik/statik.go
package main

import (
    "fmt"
    "io/ioutil"
    "os"

    _ "github.com/zhaojh329/rttys/statik"
    "github.com/rakyll/statik/fs"
)

// Before buildling, run go generate.
func main() {
    statikFS, err := fs.New()
    if err != nil {
        fmt.Printf("err: %v\n", err)
        os.Exit(1)
    }   

    file, err := statikFS.Open("/index.html")
    if err != nil {
        fmt.Printf("err: %v\n", err)
        os.Exit(1)
    }   
    content, err := ioutil.ReadAll(file)
    if err != nil { 
        fmt.Printf("err: %v\n", err)
        os.Exit(1)
    }   
    fmt.Printf("content: %s\n", content)
}