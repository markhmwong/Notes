import UIKit

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        
        if (numRows == 1) {
            return s
        }
        
        var rowArr: [String] = []
        for _ in 0...numRows {
            rowArr.append("")
        }
        var index = 0
        var step = -1
        for char in s {
            rowArr[index] = "\(rowArr[index])\(String(char))"

            if (index == 0 || index == numRows - 1) {
                step = -step
            }
            index = index + step

        }
        return rowArr.reduce("") { (result, nextStr) -> String in
            return result + nextStr
        }
    }
}

let s = Solution()
s.convert("ABC", 1)

/*
 Runtime 108ms memory 19.6MB
 At first a mathematical approach seemed like a good idea. Although this is even better with one pass in the array resulting in O(N) in time complexity and an O(N) in space. N being the length of the arrays
 
 We traverse through the original string by stepping down and up on the condition we stay within the numRows - 1 and 0 bounds. The step acts as the row for which the character belongs in, we use the row as the index for the rowArray. Since there isn't any sorting required, a forward step to the end of the array is all that is needed.
 */
