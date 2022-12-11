package main

var _ = func(read4 func([]byte) int) func([]byte, int) int {
	return func(buf []byte, n int) int {
		eof := false
		read := 0
		for !eof && read < n {
			temp := make([]byte, 4)
			r := read4(temp)
			if r == 0 {
				eof = true
			}
			rr := min(n-read, r)
			for i := read; i < rr+read; i++ {
				buf[i] = temp[i-read]
			}
			read += rr
		}
		return read
	}
}

func min(x, y int) int {
	if x < y {
		return x
	}

	return y
}
