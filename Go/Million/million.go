package main

import (
	"fmt"
	"math"
	"math/rand"
	"time"
)

func BinarySearch(index []int, target int) bool {
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

func LinarSearch(index []int, target int) bool {
	for _, v := range index {
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

func createArray(size int) []int {
	var array []int
	for i := 0; i < size; i++ {
		array = append(array, i)
	}
	return array
}

func main() {
	// select Target
	target := randomNumber(1000000)
	fmt.Println("target:", target)

	// create array
	index := createArray(1000000)

	// binary search
	start_bs := time.Now()
	result_bs := BinarySearch(index, target)
	time_bs := time.Since(start_bs)
	fmt.Println("binary search:", result_bs)
	fmt.Println("time: ", time_bs)

	// linear search
	start_ls := time.Now()
	result_ls := LinarSearch(index, target)
	time_ls := time.Since(start_ls)
	fmt.Println("linear search:", result_ls)
	fmt.Println("time: ", time_ls)

	// How much faster is binary search than linear search?
	timeGo := time_ls.Seconds() / time_bs.Seconds()
	fmt.Println("Binary Search is", math.Round(timeGo), "times faster than linear search in Go")

	// Store Values from Python
	PythonBS, _ := time.ParseDuration("0.033030573000360164s")
	PythonLS, _ := time.ParseDuration("90.90776229600124s")
	TimePython := PythonLS.Seconds() / PythonBS.Seconds()

	// Print Comprehension from Pyhton
	fmt.Println("Binary Search is", math.Round(TimePython), "times faster than linear search in Python")

	// Print Comprehension from Binary Search
	fmt.Println("Python Binary Search is", math.Round(PythonBS.Seconds()/time_ls.Seconds()), "times slower than Go Binary Search")

	// Print Comprehension from Linear Search
	fmt.Println("Python Linear Search is", math.Round(PythonLS.Seconds()/time_ls.Seconds()), "times slower than Go Linear Search")
}
