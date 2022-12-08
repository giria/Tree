//: [Previous](@previous)

/*:
 
 
 ## Breadth First Search (BFS)
 
 
 
 
 
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




var bfsResult:[Int] = []
 
 func bfs(_ root: TreeNode?)  {
     guard let root = root else { return }
     var stack = [root]
     
     while !stack.isEmpty {
         
             let removedElement = stack.removeFirst() // remove the first entry
             bfsResult.append(removedElement.val)  // process node
             
             if let left = removedElement.left {
                 stack.append(left)
             }
             if let right = removedElement.right {
                 stack.append(right)
             }
         
     }
   
 }

   let root = TreeNode(1)
   root.left =  TreeNode(2)
   root.right = TreeNode(5)
   root.left!.left = TreeNode(3)
   root.left!.right = TreeNode(4)
   bfs(root)
   print(bfsResult)  // Prints: [1, 2, 5, 3, 4]


//: [Next](@next)
