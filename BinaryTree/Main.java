package BinaryTree;

import java.util.ArrayList;

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
        
        System.out.println("=========== 1 imbalance nodes ============");
        System.out.println(binTree.isBalance()); // this return false 
        ArrayList<BinaryTreeNode> imNodes = binTree.findImbalanceNodes();
        for (BinaryTreeNode node: imNodes){
            System.out.println(node.value);
        }
        

        // add one more node to make balance tree
        System.out.println("========== Balanced case ==========");
        binTree.root.left.right = new BinaryTreeNode(8);
        System.out.println(binTree.isBalance()); // this return true
        imNodes = binTree.findImbalanceNodes();  // nothing is printed 
        for (BinaryTreeNode node: imNodes){
            System.out.println(node.value);
        }


        // multiple imbalance node 
        System.out.println("========== Multiple imbalance nodes =============");
        binTree.root.left.right = null; // remove node 8
        binTree.root.right.right = null; // remove node 5
        System.out.println(binTree.isBalance()); // this return false 
        imNodes = binTree.findImbalanceNodes();
        for (BinaryTreeNode node: imNodes){  // imbalance nodes: 3, 1
            System.out.println(node.value);
        }


        // tree:
            //     1
            //   /    \
            // 2       3
            //         | 
            //         4   
            //       / |
            //     6   7

    }
    
}
