class ReverseIntegerSolution {
    func reverse(_ x: Int) -> Int {
        
        var pop = 0
        var val = x
        var rev = 0
        //deal with overflow
        if (x > Int32.max || x < Int32.min) {
            return 0
        }
        
        while (val != 0) {
            //pop
            pop = val % 10
            val = val / 10
            
            rev = rev * 10 + pop
            
            print(rev)
        }
        
        if (rev > Int32.max || rev < Int32.min) {
            return 0
        }
        
        return rev
    }
}

var s = ReverseIntegerSolution()
s.reverse(1534236469)

/*
Leetcode
runtime 32ms
memory 18.7mb
 
 
 
 */
