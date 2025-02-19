package hashchecker_test

import (
	"testing"
)

func TestBruteForceOnString(t *testing.T) {

	testStr := GetMD5Hash("test")
	println(testStr)
	brute := BruteForce("MD5", testStr, 100000, 4)

	if testStr != brute {
		t.Error("Failure: The brute force result does not match the test string.", testStr, brute)
	} else {
		t.Log("Success: The brute force result matches the test string.", testStr, brute)
	}
}
