import UIKit

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        
        if(x < 0 || (x % 10 == 0 && x != 0)) {
            return false;
        }
        
        var rev = 0
        var value = x
//        var pop = 0
        //push and pop
        //passed the middle of the number when the value is less than the poppedNumber (reversed)
        
        while (rev < value) {
            
            // pop = value % 10
            rev = rev * 10 + (value % 10)

            value = value / 10

        }

        if (value == (rev / 10)) { //odd
            return true
        }

        if (value == rev) {//even
            return true
        }

        return false
    }
}


let s = Solution()
print(s.isPalindrome(0))

/*
Algorithm

Similar to the push and pop method of Reversing an Integer without using strings. Since each number 'popped' from the right of the integer is effectively reversing the number. 12345 - 5 would be popped off and placed in the rev variable.

Another feature to mention is that we are seeking the first half of the integer to be equal to the second half (the reversed). If they're equal then we have a palindrome number and since we are dealing with only half the number, in all cases the middle number if it's an odd amount of numbers, can be ignored because it will be the same - divided it by 10. We still have to count it for the even as it is repeated - 1221, four numbers but the 2 is repeated.



Time complexity O(log10 n), since the input is divded by 10 every iteration

space complexity O(1)
*/
