package Tree;

import java.util.LinkedList;
import java.util.Queue;

public class Tree {
    Node root;

    public Node findNode(int value){
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
