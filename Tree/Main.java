package Tree;

public class Main {

    public static void main(String[] args) {
        Tree tree = new Tree();
        Node root = new Node(1);
        tree.root = root;


        Node node = new Node(50);
        tree.root.children.add(node);


        node = new Node(40);
        tree.root.children.add(node);

        node = tree.findNode(50);

        if (node != null){
            node.children.add(new Node(10));

        } else {
            System.out.println("Tree dont have node value 50");
        }


        // verify
        System.out.println(root.children.get(0).value); // get node 50 which is child of root 
        System.out.println(root.children.get(0).children.get(0).value); // 10 is child of 50 now 
    
    }




    
}
