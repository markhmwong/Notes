class TwoSumSolution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //complement
        //map out the complement
        
        //1
        var complementDict: [Int: Int] = [:]
        
        //2
        for index in stride(from: 0, to: nums.count, by: 1) {
            complementDict[nums[index]] = index
        }
        
        //3
        for i in stride(from: 0, to: nums.count, by:1) {
            //3.1
            let complement = target - nums[i]
            
            //3.2
            if (complementDict.keys.contains(complement) && complementDict[complement] != i) {
                guard let complementIndex = complementDict[complement] else {
                    return []
                }
                return [i, complementIndex]
            }
        }
        return []
    }
}

/*Algorithm
 Find if the complement at an index exists within the given array for a target.

 E.g. Target 9.
 
 Index 0 is 2 and it's complement is 7
 Index 1 is 7 and it's complement is 2
 Index 2 is 11 and it's complement is -2
 etc
 
 Sample Data:
 [2, 7, 11, 15]
 Sample solution (returns the indexes):
 [0, 1]
 
 Naive method / Brute Force
 We can iterate over the array for each index and compare it to the remainding array. This would feature a nested array giving a time complexity of O(N^2). One loop for the target and the nested loop to compare the other indexes to the target. That's okay but we can do better.
 
 Hash Table (two pass)
 
 In this method - featured above - we pass through the array twice in sequential order. The main difference between the brute force method and the HashTable is that the algorithm is O(2N) and we sacrifice some space for speed using a HashTable.
 
 Step by step overview
 //1
 We initialise the dictionary (our lookup for complements)
 //2
 Map potential complements into the array - [ complement : index ]
 //3
 loop over the input array
    //3.1
    calculate the complement
    //3.2
    check if the complement exists in the hashtable we created in //1
 

Time Complexity
 Two sequenctial loops - 2N - representing each of the for loops. O(N) since 2 doesn't have much effect. 
Space Complexity
 O(N) - N being the size of the dictionary/hashtable
*/
