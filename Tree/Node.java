package Tree;

import java.util.ArrayList;

public class Node {
    Integer value;
    ArrayList<Node> children;


    public Node (int val){
        this.value = val;
        this.children = new ArrayList<>();
    }

}
