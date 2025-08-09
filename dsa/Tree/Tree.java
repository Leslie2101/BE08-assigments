package Tree;

import java.util.LinkedList;
import java.util.Queue;

public class Tree {
    Node root;



    public Node findNodeDFS(int value){
         // find from root
        return findNodeDFS(root, value);
    }


    public Node findNodeDFS(Node node, int value){
        // find node with DFS and recursion
        // time complexity: O(n), space complexity: O(n)
        if (node == null) return null;  

        // explore children first 
        for (Node child: node.children){
            Node found = findNodeDFS(child, value);
            if (found != null) return found; 
        }

        // explore current node 
        if (node.value == value) return node;

        return null;
    }

    public Node findNode(int value){
        
        // space complexity: O(n), time complexity:O(n) 
        Queue<Node> queue = new LinkedList<>();


        queue.add(root);

        while (!queue.isEmpty()){
            Node cur = queue.poll();

            if (cur.value == value){
                return cur;
            }


            for (Node child: cur.children){
                queue.add(child);
            }
        }


        return null; // not found 
    }
}
