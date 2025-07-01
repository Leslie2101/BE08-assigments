package BinaryTree;

import java.util.ArrayList;

import javax.swing.tree.TreeNode;

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


    public void balance(){
        if (isBalance()) return;

        this.root = balance(root, new int[1], new int[1], new int[1]);
    }


    public BinaryTreeNode balance(BinaryTreeNode node, int[] height, int[] leftH, int[] rightH){
        if (node == null) {
            height[0] = 0;
            leftH[0] = 0;
            rightH[0] = 0;
            return node;
        }
        // diff: // difference height between left subtree and right subtree

        int[] leftHeight = new int[1];
        int[] rightHeight = new int[1];

        int[] llH = new int[1];
        int[] lrH = new int[1];

        int[] rlH = new int[1];
        int[] rrH = new int[1];
   

        // recursive balance left and right 
        node.left = balance(node.left, leftHeight, llH, lrH);
        node.right = balance(node.right, rightHeight, rlH, rrH);

        leftH[0] = leftHeight[0];
        rightH[0] = rightHeight[0];




        if (leftHeight[0] - rightHeight[0] > 1){
            // rotate left subtree if the left.left < left.right
            if (llH[0] < lrH[0]){
                node.left = rotateLeft(node.left);
                llH[0] += 1;
                lrH[0] -= 1;
            }

            // now in the left subtree, the left branch is always >= right branch
            leftH[0] = llH[0] + 1; 
            
            node = rotateRight(node);

            leftH[0] -= 1;

            // after rotate, the right subtree has: right branch of previous right subtree, left branch with right children of left subtree
            rightH[0] = 1 + Math.max(rightH[0], lrH[0]);


            // System.out.println("node " + node.value+ " llH: " + llH[0] + " lrH " + lrH[0]);

            
        
        } else if (rightHeight[0] - leftHeight[0] > 1){
            // rotate right subtree if the right.right < right.left
            if (rrH[0] < rlH[0]){
                System.out.println("node " + node.value+ " rrH: " + rrH[0]);
                node.right = rotateRight(node.right);
                rrH[0] += 1;
                rlH[0] -= 1;
            }

            // now in the right subtree, the right branch is longest 
            rightH[0] = rrH[0] + 1;

            node = rotateLeft(node);

            rightH[0] -= 1;

            // after rotate, the left subtree has: left branch with previous left subtree, right branch with left children of right subtree
            leftH[0] = 1 + Math.max(leftH[0], rlH[0]); 
        }


        height[0] = Math.max(rightH[0], leftH[0]) + 1;
        
        return node; 
        
    }

    public BinaryTreeNode rotateRight(BinaryTreeNode node){
        //     /
        //    /
        //   /
        BinaryTreeNode newRoot = node.left;
        node.left = newRoot.right;
        newRoot.right = node;
        return newRoot;
        
    }

    public BinaryTreeNode rotateLeft(BinaryTreeNode node){
        //     \
        //      \
        //       \
        BinaryTreeNode newRoot = node.right;
        node.right = newRoot.left;
        newRoot.left = node;
        return newRoot;
        
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
        if (Math.abs(leftHeight[0] - rightHeight[0]) <= 1) return true;
        return false;

    }


    public ArrayList<BinaryTreeNode> findImbalanceNodes(){
        // similar logic as above, we use an array as parameter to allow adding in each recursion function
        ArrayList<BinaryTreeNode> imbalanceNodes = new ArrayList<>();
        findImbalancedNodes(root, imbalanceNodes);
        if (imbalanceNodes.isEmpty()) System.out.println("No imbalance nodes");

        return imbalanceNodes;
    }


    public int findImbalancedNodes(BinaryTreeNode node, ArrayList<BinaryTreeNode> imBinaryTreeNodes){
        if (node == null) {
            return 0;
        };


        int leftHeight = findImbalancedNodes(node.left, imBinaryTreeNodes);
        int rightHeight = findImbalancedNodes(node.right, imBinaryTreeNodes);


        // check if current node is imbalance
        if (Math.abs(leftHeight - rightHeight) > 1){
            imBinaryTreeNodes.add(node);
        }

        return Math.max(leftHeight, rightHeight) + 1;

    }

}
