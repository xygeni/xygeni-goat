package main

import (
  "context"
  "fmt"
  "log"

  "github.com/ethereum/go-ethereum/common"
  "github.com/ethereum/go-ethereum/ethclient"
)

func main() {
    client, err := ethclient.Dial("https://eth-mainnet.g.alchemy.com/v2/ZGYzkZB9B56tf3gJrBEhrXKaPtWW3KYY")
    if err != nil {
        log.Fatal(err)
    }

    // Get the balance of an account
    account := common.HexToAddress("0xjkfds87njklfhjds8fjkf898sd98d9asjkdja")
    balance, err := client.BalanceAt(context.Background(), account, nil)
    if err != nil {
        log.Fatal(err)
    }
    fmt.Println("Account balance:", balance)

    // Get the latest known block
    block, err := client.BlockByNumber(context.Background(), nil)
    if err != nil {
        log.Fatal(err)
    }
    fmt.Println("Latest block:", block.Number().Uint64())
}
