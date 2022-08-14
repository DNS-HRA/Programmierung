package main

import (
	"fmt"
	"math/rand"
	"time"
)

func binarySearch(index []int, target int) bool {
	low := 0
	high := len(index) - 1
	for low <= high {
		mid := (low + high) / 2
		if index[mid] < target {
			low = mid + 1
		} else if index[mid] > target {
			high = mid - 1
		} else {
			return true
		}
	}
	return false
}

func linarSearch(index []int, target int) bool {
	for _, v := range index{
		if v == target {
			return true
		}
	}
	return false
}

func randomNumber(max int) int {
	rand.Seed(time.Now().Unix())
	return rand.Intn(max)
}

func main() {
var array []int;
for i := 0; i <= 1000000; i++ {
	array = append(array, i)
}

target := randomNumber(1000000)

fmt.Println("target: ", target)

start_bs := time.Now()
result_bs := binarySearch(array, target)
end_bs := time.Now()
fmt.Println("binary search: ", result_bs)
fmt.Println("time: ", end_bs.Sub(start_bs))

start_ls := time.Now()
result_ls := linarSearch(array, target)
end_ls := time.Now()
fmt.Println("linear search: ", result_ls)
fmt.Println("time: ", end_ls.Sub(start_ls))

fmt.Println("Binary Search is ", ((end_bs.Sub(start_bs)) / (end_ls.Sub(start_ls))), " faster than linear search")
}