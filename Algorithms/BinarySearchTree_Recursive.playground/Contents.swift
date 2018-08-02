//Binary Search Tree - A recursive implementation
//https://en.wikipedia.org/wiki/Binary_search_tree and https://www.youtube.com/watch?v=UcOxGmj45AA as a guide

import UIKit

class Node : Equatable {
    var key: Int
    var value: String
    
    var leftChild:Node? = nil
    var rightChild:Node? = nil
    
    init(value: String, key: Int) {
        self.key = key
        self.value = value
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.key == rhs.key
    }
}

class BinaryTree {
    var currNode: Node?
    var parentNode: Node?
    var rootNode: Node? // traversal
    var traversalArray: [Int] = []
    init() {
        
    }
    
    func insertNodeRecursively(newNode:Node?) {
        
        guard let new = newNode else {
            return
        }
        
        //sets up the initial node (root node)
        guard let curr = currNode else {
            rootNode = new
            currNode = new
            return
        }
        
        //compare for left insertion
        if new.key < curr.key {
            
            //check if left child node is available
            if curr.leftChild == nil {
                //we've found a place to insert a node
                curr.leftChild = new
                //reset the node position
                currNode = rootNode
                return
            }
            
            //we continue our search if the location is not available
            //we move the focus of the left child to the current node
            //and keepa  reference to the parentNode
            parentNode = currNode
            
            currNode = curr.leftChild
            self.insertNodeRecursively(newNode: new)
        }
        else {
            //check if right child node is available
            if curr.rightChild == nil {
                //we've found a place to insert a node
                curr.rightChild = new
                //reset the node position
                currNode = rootNode
                return
            }
            parentNode = currNode
            
            currNode = curr.rightChild
            self.insertNodeRecursively(newNode: new)
        }
        
        return
    }
    
    //InOrder
    //15, 25, 30, 50, 75, 85
    func inOrderTraversal(targetNode: Node?) {
        
        guard let target = targetNode else {
            return
        }
        
        inOrderTraversal(targetNode:target.leftChild)
        print(target.key)
        traversalArray.append(target.key)
        inOrderTraversal(targetNode:target.rightChild)
        
    }
    
    func preOrderTraversal(targetNode: Node?) {
        
        guard let target = targetNode else {
            return
        }
        
        print(target.key)
        preOrderTraversal(targetNode:target.leftChild)
        preOrderTraversal(targetNode:target.rightChild)
    }
    
    func postOrderTraversal(targetNode: Node?) {
        
        guard let target = targetNode else {
            return
        }
        postOrderTraversal(targetNode:target.leftChild)
        postOrderTraversal(targetNode:target.rightChild)
        print(target.key)
    }
    
    func findNode(key: Int, targetNode: Node?) -> Node? {
        
        guard let target = targetNode else {
            return nil
        }
        //return if we're successful
        
        if target.key == key {
            return target
        }
        else {
            //if not found we continue to search left or right depending on the comparison
            if key < target.key {
                //left side
                return findNode(key: key, targetNode: target.leftChild)
            }
            else {
                return findNode(key: key, targetNode: target.rightChild)
            }
        }
    }
    
    /*
        Remove Node
    */
    func removeNode(key: Int) -> Bool { //change return type
        
//        if let mySearchedNode = findNodeWithSide(key: key, targetNode: self.rootNode!) {
//            print(mySearchedNode.isALeftChild)
//            print(mySearchedNode.targetNode?.key)
//            print(mySearchedNode.targetNode?.value)
//        }
        
        var isALeftChild = true
        var pNode: Node? //parent Node

        //find node
        guard var target = self.rootNode else {
            return false
        }

        while (key != target.key) {
            pNode = target
            if key < target.key {
                
                isALeftChild = true
                guard target.rightChild != nil else {
                    return false
                }
                target = target.leftChild!
            }
            else {
                
                isALeftChild = false
                guard target.rightChild != nil else {
                    return false
                }
                target = target.rightChild!
            }
        }
        
        
        
        //no children
        if target.leftChild == nil && target.rightChild == nil {
            print("test")
            guard let rn = self.rootNode else {
                return false
            }

            if target == rn {
                self.rootNode = nil
            }
            else if isALeftChild {
                pNode?.leftChild = nil
            }
            else {
                pNode?.rightChild = nil
            }
        }
        else if target.rightChild == nil {
            //left child only

            guard let rn = self.rootNode else {
                return false
            }

            if target == rn {
                self.rootNode = target.leftChild
            }
            else if isALeftChild {
                pNode?.leftChild = target.leftChild
            }
            else {
                pNode?.rightChild = target.leftChild
            }

        }
        else if target.leftChild == nil {
            //right child only

            guard let rn = self.rootNode else {
                return false
            }

            if target == rn {
                self.rootNode = target.rightChild
            }
            else if isALeftChild {
                pNode?.leftChild = target.rightChild
            }
            else {
                pNode?.rightChild = target.rightChild
            }
        }
        else {
            //the target node has two children

            guard let rn = self.rootNode else {
                return false
            }

            //root node has two children
            if target == rn {
                print("root node")
                //we can do an inorder traversal and find the successor node.
                //finding the successor node means the next minimum no in it's subtree
                self.inOrderTraversal(targetNode: self.rootNode)
                var targetIndex: Int = self.findMinSuccessorIndex(key: target.key, isALeftChild: isALeftChild)
                
                //grab the nodes
                var successorNodeWithSide = findNodeWithSide(key: traversalArray[targetIndex], targetNode: self.rootNode)
                var successorParentNodeWithSide: (isALeftChild: Bool, targetNode: Node?)?
                if (successorNodeWithSide?.isALeftChild)! {
                    successorParentNodeWithSide = findNodeWithSide(key: traversalArray[targetIndex + 1], targetNode: self.rootNode)!
                }
                else {
                    successorParentNodeWithSide = findNodeWithSide(key: traversalArray[targetIndex - 1], targetNode: self.rootNode)!
                }
                
                //copy successor node to the target node (root)
                if let k = successorNodeWithSide?.targetNode?.key {
                    self.rootNode?.key = k
                }
                if let v = successorNodeWithSide?.targetNode?.value {
                    self.rootNode?.value = v
                }
                
                //deal with duplicate node and we the check two things whether the successory node has children or a right child
                //again we know it won't have a left child because the successor is already the minimum node.
                //does the succesor node have no children we remove the node because it's a duplicate node
                if successorNodeWithSide?.targetNode?.leftChild == nil && successorNodeWithSide?.targetNode?.rightChild == nil {
                    //not being deleted
                    if (successorNodeWithSide?.isALeftChild)! {
                        print("left child")
                        successorParentNodeWithSide?.targetNode?.leftChild = nil
                    }
                    else {
                        successorParentNodeWithSide?.targetNode?.rightChild = nil
                    }

                }
                else if successorNodeWithSide?.targetNode?.leftChild == nil {
                    //right child is not empty - now we link the right child to the parent's left child where the successor node was but now is at the root.
                    //This references the 3rd point in the BinarySearchTree file on github. A successor node will only have a right child
                    successorParentNodeWithSide?.targetNode?.rightChild = successorNodeWithSide?.targetNode?.rightChild
                }
            }
            else if isALeftChild {
                //left child with two children
                print("left child")
                self.traversalArray.removeAll()
                self.inOrderTraversal(targetNode: self.rootNode)
                var targetIndex: Int = self.findMinSuccessorIndex(key: target.key, isALeftChild: isALeftChild)
                
                var successorNodeWithSide = findNodeWithSide(key: traversalArray[targetIndex], targetNode: self.rootNode)
                var successorParentNodeWithSide: (isALeftChild: Bool, targetNode: Node?)?
                if (successorNodeWithSide?.isALeftChild)! {
                    successorParentNodeWithSide = findNodeWithSide(key: traversalArray[targetIndex + 1], targetNode: self.rootNode)!
                }
                else {
                    successorParentNodeWithSide = findNodeWithSide(key: traversalArray[targetIndex - 1], targetNode: self.rootNode)!
                }
                
                if let k = successorNodeWithSide?.targetNode?.key {
                    target.key = k
                }
                if let v = successorNodeWithSide?.targetNode?.value {
                    target.value = v
                }
                
                if successorNodeWithSide?.targetNode?.leftChild == nil && successorNodeWithSide?.targetNode?.rightChild == nil {
                    if (successorNodeWithSide?.isALeftChild)! {
                        successorParentNodeWithSide?.targetNode?.leftChild = nil
                    }
                    else {
                        successorParentNodeWithSide?.targetNode?.rightChild = nil
                    }
                }
                else if successorNodeWithSide?.targetNode?.leftChild == nil {
                    successorParentNodeWithSide?.targetNode?.rightChild = successorNodeWithSide?.targetNode?.rightChild
                }
            }
            else {
                //condition includes two children and not a root node
//                print("right child")
                self.traversalArray.removeAll()
                self.inOrderTraversal(targetNode: self.rootNode)
                var targetIndex: Int = self.findMinSuccessorIndex(key: target.key, isALeftChild: isALeftChild)
                var successorNodeWithSide = findNodeWithSide(key: traversalArray[targetIndex], targetNode: self.rootNode)
                var successorParentNodeWithSide: (isALeftChild: Bool, targetNode: Node?)?
                if (successorNodeWithSide?.isALeftChild)! {
                    successorParentNodeWithSide = findNodeWithSide(key: traversalArray[targetIndex + 1], targetNode: self.rootNode)!
                }
                else {
                    successorParentNodeWithSide = findNodeWithSide(key: traversalArray[targetIndex - 1], targetNode: self.rootNode)!
                }
                
                if let k = successorNodeWithSide?.targetNode?.key {
                    target.key = k
                }
                if let v = successorNodeWithSide?.targetNode?.value {
                    target.value = v
                }
                if successorNodeWithSide?.targetNode?.leftChild == nil && successorNodeWithSide?.targetNode?.rightChild == nil {
                    successorNodeWithSide?.targetNode = nil
                }
                else if successorNodeWithSide?.targetNode?.leftChild == nil {
                    successorParentNodeWithSide?.targetNode?.rightChild = successorNodeWithSide?.targetNode?.rightChild
                }
            }

        }
        print("\nResult:")
        self.inOrderTraversal(targetNode: self.rootNode)
        return true
    }
    
    func findMinSuccessorIndex(key: Int, isALeftChild: Bool) -> Int {
        var targetIndex: Int = 0
        for (index, k) in traversalArray.enumerated() {
            
            if k == key {
                
                targetIndex = index + 1
            }
        }
        return targetIndex
    }
    
    //targetNode beings with root node
    func findNodeWithSide(key: Int, targetNode: Node?) -> (isALeftChild:Bool, targetNode:Node?)? {

        var pNode: Node? //parent node
        var isALeftChild = true
        var target: Node? = targetNode
        
        while key != (target?.key)! {
            pNode = target //used to keep track of the parent node when we delete

            if key < (target?.key)! {
                isALeftChild = true
                target = target?.leftChild!
            }
            else {
                isALeftChild = false
                target = target?.rightChild!
            }

            if target == nil {
                return (isALeftChild, targetNode)
            }
        }
        return (isALeftChild, target)
    }
    
    

    
    func printNode(node: Node?) {
        print(node!.value)
        print(node!.key)
    }
}

var bst:BinaryTree = BinaryTree()
bst.insertNodeRecursively(newNode: Node(value: "Boss", key: 50))
bst.insertNodeRecursively(newNode: Node(value: "Vice President", key: 25))
bst.insertNodeRecursively(newNode: Node(value: "Office Manager", key: 15))
bst.insertNodeRecursively(newNode: Node(value: "Secretary", key: 30))
bst.insertNodeRecursively(newNode: Node(value: "Secretary", key: 29))
bst.insertNodeRecursively(newNode: Node(value: "Secretary", key: 31))
bst.insertNodeRecursively(newNode: Node(value: "Sales Maanger", key: 75))
bst.insertNodeRecursively(newNode: Node(value: "Sales Maanger", key: 65))
bst.insertNodeRecursively(newNode: Node(value: "Salesman 1", key: 85))
//bst.inOrderTraversal(targetNode: bst.rootNode)
//print("\n")
//bst.preOrderTraversal(targetNode: bst.rootNode)
//print("\n")
//bst.postOrderTraversal(targetNode: bst.rootNode)
//print("\n")
//if let myNode = bst.findNode(key: 30, targetNode: bst.rootNode) {
//    print("Node Found")
//    print(myNode.key)
//    print(myNode.value)
//}
//else {
//    print("Node not found")
//}
let v: Int = 6;
print(v)
if bst.removeNode(key: v) {
    print("The number \(v) was removed")
}
else {
    print("\(v) Was not removed or not found")
}
