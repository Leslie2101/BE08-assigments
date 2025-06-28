package BinaryTree;

import java.util.ArrayList;

public class BinaryTree {
    BinaryTreeNode root;


    // public BinaryTree(BinaryTreeNode node){
    //     this.root = node;
    // }


    public boolean isBalance(){
        // check height difference between left and right height 
        int[] height = new int[1]; 

        return isBalance(root, height);
    }


    public boolean isBalance(BinaryTreeNode node, int[] height){
        if (node == null) {
            height[0] = 0;
            return true;
        };


        int[] leftHeight = new int[1]; // contain place for left and right heights
        int[] rightHeight = new int[1];


        boolean leftBalance = isBalance(node.left, leftHeight);
        boolean rightBalance = isBalance(node.right, rightHeight);


        height[0] = Math.max(leftHeight[0], rightHeight[0]) + 1;

        // System.out.println(node.value +", height:" + height[0]);
        // System.out.println("left right: " + leftHeight[0] + "," + rightHeight[0]);

        if (!leftBalance || !rightBalance) return false; // imbalance since children has imbalance nodes


        // if children nodes are all balanced, check imbalance caused by current node
        return Math.abs(leftHeight[0] - rightHeight[0]) <= 1;


    }


    public ArrayList<BinaryTreeNode> findImbalanceNodes(){
        return null;
    }
}
