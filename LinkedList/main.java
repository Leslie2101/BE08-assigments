package LinkedList;

public class main {

    public static void main(String[] args) {
        LinkedList linkedList = new LinkedList();

        LinkedListItem head = new LinkedListItem(0);


        // create linked list with value from 0 to 5
        linkedList.head = head;
        for (int i = 1; i < 6; i++){
            LinkedListItem item = new LinkedListItem(i);
            head.next = item;
            head = head.next;
        }

        System.out.println("Original linked list: ");
        printLinkedList(linkedList);  // 0, 1, 2, 3, 4, 5



        // insert a node value (7) to index 2 
        System.out.println("Insert node value 7 at index 2: ");
        LinkedListItem insertNode = new LinkedListItem(7);
        linkedList.insert(2, insertNode);

        printLinkedList(linkedList);  // 0, 1, 7, 2, 3, 4, 5

        // insert node value -1 at head 

        System.out.println("Insert node -1 at head");
        LinkedListItem headNode = new LinkedListItem(-1);
        linkedList.insert(0, headNode);

        printLinkedList(linkedList); // -1, 0, 1, 7, 2, 3, 4, 5

        // insert node value 6 at tail 
        System.out.println("Insert node 6 at tail: ");
        LinkedListItem tailNode = new LinkedListItem(6);
        linkedList.insert(8, tailNode);

        printLinkedList(linkedList); // -1, 0, 1, 7, 2, 3, 4, 5, 6


        // delete tail node - index 8
        System.out.println("delete tail node");
        linkedList.delete(8);
        printLinkedList(linkedList); // -1, 0, 1, 7, 2, 3, 4, 5

        // delete head node
        System.out.println("delete head node - index 0");
        linkedList.delete(0);
        printLinkedList(linkedList); // 0, 1, 7, 2, 3, 4, 5

        // delete node at index 2
        System.out.println("delete node at index 2");
        linkedList.delete(2);
        printLinkedList(linkedList); // 0, 1, 2, 3, 4, 5





        

    }



    public static void printLinkedList(LinkedList linkedList){
        LinkedListItem cur = linkedList.head;


        while (cur.next != null){
            System.out.print(cur.value + " -> ");
            cur = cur.next;
        }

        System.out.print(cur.value);

        System.out.println();
    }
    
}
