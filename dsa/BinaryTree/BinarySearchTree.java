package BinaryTree;

import java.util.LinkedList;

public class BinarySearchTree extends BinaryTree {

    public void buildBST(int[] nums){
        
        for (int num: nums){
            BinaryTreeNode node = new BinaryTreeNode(num);
            insert(node);
            balance();
        }
        

    }


    public void insert(BinaryTreeNode node){
        // if tree is empty: new node is root 
        if (root == null){
            root = node;
            return;
        }


        // if tree not empty: insert following BST
        BinaryTreeNode parent = null;

        BinaryTreeNode cur = root;
        boolean isLeft = true;

        while (cur != null){
            parent = cur;
            if (node.value < cur.value){
                cur = cur.left;
                isLeft = true;
            } else {
                cur = cur.right;
                isLeft = false;
            }
        }

        // insert new node as leaf 
        if (isLeft) {
            parent.left = node;
        } else {
            parent.right = node;
        }

    


    }



    public void printBST(){

        LinkedList<BinaryTreeNode> linkedList = new LinkedList<>();
        linkedList.add(root);

        while (!linkedList.isEmpty()){
            BinaryTreeNode curNode = linkedList.pollFirst();
            System.out.print(curNode.value + ", ");

            if (curNode.left != null) linkedList.addLast(curNode.left);
            if (curNode.right != null) linkedList.addLast(curNode.right);

        }
        System.out.println();
    }
    
}
