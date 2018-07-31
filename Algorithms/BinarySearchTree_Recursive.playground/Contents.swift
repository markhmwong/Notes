//Binary Search Tree - A recursive implementation

import UIKit

class Node {
    var key: Int
    var value: String
    
    var leftChild:Node? = nil
    var rightChild:Node? = nil
    
    init(value: String, key: Int) {
        self.key = key
        self.value = value
    }
}

class BinaryTree {
    var currNode: Node?
    var parentNode: Node?
    var rootNode: Node? // traversal
    
    init() {
        
    }
    
    func insertNodeRecursivelyB(newNode:Node?) {
        
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
        preOrderTraversal(targetNode:target.leftChild)
        preOrderTraversal(targetNode:target.rightChild)
        print(target.key)
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
bst.insertNodeRecursively(newNode: Node(value: "Sales Maanger", key: 75))
bst.insertNodeRecursively(newNode: Node(value: "Salesman 1", key: 85))
//bst.inOrderTraversal(targetNode: bst.rootNode)
bst.preOrderTraversal(targetNode: bst.rootNode)
//bst.postOrderTraversal(targetNode: bst.rootNode)
