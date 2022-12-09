//: [Previous](@previous)
/*:
 
 # Maximum Difference Between Node and Ancestor
 
 Leetcode 1026
 
 */


/**
 * Definition for a binary tree node.
 */
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

func maxAncestorDiff(_ root: TreeNode?) -> Int {
     guard let root = root else { return 0 }
     return dfs(root, root.val, root.val)
 }
 
 private func dfs(_ root: TreeNode?, _ valMax: Int, _ valMin: Int) -> Int {
     guard let root = root else { return valMax - valMin }
     
     let value = (min: min(valMin, root.val),
                  max: max(valMax, root.val))
     
     let result = (left: dfs(root.left, value.max, value.min),
                   right: dfs(root.right, value.max, value.min))
     
     return max(result.left, result.right)
 }




let root = TreeNode(1)
root.left =  TreeNode(2)
root.right = TreeNode(6)
root.left!.left = TreeNode(3)
root.left!.right = TreeNode(4)

print( maxAncestorDiff(root))  // Prints 5

//: [Next](@next)
