




/*:  # Tree traversal
 
 Let’s talk about one of the data structure, which is called Binary Tree.
 Binary Tree, is one of the hierarchal data structure in which each node has at most two children .We call them as left child and right child.
 Main is the root node, others are child node.
 
 ![Traversal](binaryTree.png)
 
 
 
 As an example lets calculate the number of nodes of a tree
 ## Pre-Order
 Pre-order Traversal : In simple terms, in the above tree diagram, as the name suggest, pre-order , just think about the root. For pre-order, root must be visited first, than left subtree and at last right subtree
*/

 // Definition for a binary tree node.
  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
          self.left = left
          self.right = right
      }
  }


func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root else { return [] }
    return [root.val] + preorderTraversal(root.left) + preorderTraversal(root.right)
}

let root = TreeNode(1)
root.left =  TreeNode(2)
root.right = TreeNode(5)
root.left!.left = TreeNode(3)
root.left!.right = TreeNode(4)

print(preorderTraversal(root))    //Print: [1,2,3,4,5]


/*:
 We can also calculate the total number of nodes with a little modification
*/

    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return 1 + countNodes(root.left) + countNodes(root.right)
    }

  print(countNodes(root))  // Prints:  5


/*:  ## In-order
 
 
 
 */

func inOrder(_ root: TreeNode?) -> [Int] {
    guard let root else { return [] }
    var result = [Int]()
    result += inOrder(root.left)
    result.append(root.val)
     result += inOrder(root.right)
    return result
}
print(inOrder(root))  //Prints: [3, 2, 4, 1, 5]


/*:

## Post-Order
 
 For post-order, root must be visited last. First left subtree, then right subtree and finally root.
*/


func postOrder(_ root: TreeNode?) -> [Int] {
    guard let root else { return [] }
    var result = [Int]()
    result += postOrder(root.left)
    result += postOrder(root.right)
    result.append(root.val)
    return result
    
}

print( postOrder(root) )  // Prints [3, 4, 2, 5, 1]
