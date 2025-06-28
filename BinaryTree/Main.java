package BinaryTree;

public class Main {


    public static void main(String[] args) {
        
        BinaryTree binTree = new BinaryTree();
        binTree.root = new BinaryTreeNode(1);

        binTree.root.left = new BinaryTreeNode(2); 
        binTree.root.right = new BinaryTreeNode(3); 

        binTree.root.right.left = new BinaryTreeNode(4);
        binTree.root.right.right = new BinaryTreeNode(5);

        binTree.root.right.left.left = new BinaryTreeNode(6);
        binTree.root.right.left.right = new BinaryTreeNode(7);

        // tree:
            //     1
            //   /    \
            // 2       3
            //         | \
            //         4   5
            //       / |
            //     6   7
        
        System.out.println(binTree.isBalance()); // this return false 
        
        // add one more node to make balance tree
        binTree.root.left.right = new BinaryTreeNode(8);
        System.out.println(binTree.isBalance()); // this return true

    }
    
}
