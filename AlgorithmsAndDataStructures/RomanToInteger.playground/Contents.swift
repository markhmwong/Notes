import UIKit

class Solution {
    func romanToInt(_ s: String) -> Int {
        var romanDictionary: [ String : Int ] = [:]
        romanDictionary["I"] = 1
        romanDictionary["V"] = 5
        romanDictionary["X"] = 10
        romanDictionary["L"] = 50
        romanDictionary["C"] = 100
        romanDictionary["D"] = 500
        romanDictionary["M"] = 1000

        var sum = 0
        var i = 0
        while (i < s.count) {
            let char = s[s.index(s.startIndex, offsetBy: i)]
            
            guard var value = romanDictionary[String(char)] else {
                return -1
            }
            
            if (i + 1 < s.count) {
                let nextChar = s[s.index(s.startIndex, offsetBy: i + 1)]
                guard let nextValue = romanDictionary[String(nextChar)] else {
                    return -1
                }
                
                if (value < nextValue) {
                    value = nextValue - value //IV 5 - 1
                    i = i + 1
                }
            }


            sum = sum + value
            i = i + 1
        }
        return sum
    }
}

let s = Solution()
print(s.romanToInt("MCMXCIV"))

/*
 //since roman numerals are writen right to left - largest to smallest.
 //if it is smaller than the next value then we apply the special case
 
 Uses a hashmap/dictionary to correlate the roman numeral to a value O(1) lookup
 
 Time complexity
 Loops through the String only once O(N) - N being the length of the string
 
 Space complexity
*/
