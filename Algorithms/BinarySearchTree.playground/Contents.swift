//: Playground - noun: a place where people can play

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
    var rootNode: Node?
    var currNote: Node?
    var parentNode: Node?
    
    init() {
        
    }
    
    func insertNodeRecursively(newNode:Node?) {
        
        guard let new = newNode else {
            return
        }
        
        guard let root = rootNode else {
            rootNode = newNode
            return
        }
        
        
        
    }
    
    func insertNode(newNode:Node?) {
        //start from the root, we check if the data is nil
        //for the inserted node and the root node
        
        guard let new = newNode else {
            return
        }
        
        guard let root = rootNode else {
            rootNode = newNode
            return
        }
        
        var currNode:Node = root
//        var parentNode:Node
        
        //compare with the current node for left insertion
        if new.key < currNode.key {
           
            //is the left child node available
            if currNode.leftChild == nil {
                currNode.leftChild = new
                return
            }
            
            //if not available we continue to look further
            insertNode(newNode: new)
        }
        else {
            
            //is the left child node available
            if currNode.rightChild == nil {
                currNode.rightChild = new
                return
            }
            
            //if not available we continue to look further
            insertNode(newNode: new)
        }
        
        
        
//        while true {
//            print("test")
//            parentNode = currNode
//
//            if new.key < currNode.key {
//
//                if let left = currNode.leftChild {
//                    currNode = left
//                }
//                else {
//                    parentNode.leftChild = newNode
//                    return
//                }
//            }
//            else {
//
//                if let right = currNode.rightChild {
//                    currNode = right
//                }
//                else {
//                    parentNode.rightChild = newNode
//                    return
//                }
//            }
//            
//        }
        
//        if let rootNode == nil {
//            rootNode = newNode
//        }
//        else {
//            //start point
//            var currNode:Node = rootNode
//            var parentNode:Node
//
//            //compare keys
//            while true {
//
//                //we use parent node to keep track of the previous node we looked at
//                parentNode = currNode
//
//                if newNode.key < currNode.key {
//
//                    currNode = currNode.leftChild
//
//                    if currNode == nil {
//                        parentNode.leftChild = newNode;
//                        return;
//                    }
//                }
//                else {
//
//                    currNode = currNode.rightChild
//
//                    if currNode == nil {
//                        parentNode.rightChild = newNode;
//                        return;
//                    }
//                }
//            }
//        }
    }

    //search
    
    //remove
    
    //traversal
    //preorder
    
    //postorder
    
    //inorder
//    func inOrderTraversal(currNode:Node) {
//
//        if let node = currNode {
//            inOrderTraversal(currNode: node.leftChild)
//            print(node)
//            inOrderTraversal(currNode: node.rightChild)
//        }
//    }
}

var bst:BinaryTree = BinaryTree()
bst.insertNode(newNode: Node(value: "Boss",key: 50))
bst.insertNode(newNode: Node(value: "Vice President",key: 25))
bst.insertNode(newNode: Node(value: "Office Manager",key: 15))
