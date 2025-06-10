package LinkedList;

public class LinkedList {
    public LinkedListItem head;


    public LinkedList(){

    }




    public boolean insert(int index, LinkedListItem item){
        
        if (index == 0){
            item.next = head;
            this.head = item;
            return true;
        }

        LinkedListItem prev = null;
        LinkedListItem cur = head;
        int i = 0;

        while (i < index){

            if (cur == null) return false; // index out of bound
            
            prev = cur;
            cur = cur.next;
            i++;
        }

        prev.next = item;
        item.next = cur;

        return true;
    }



    public boolean delete(int index){

        if (head == null) return false; // cannot delete from empty linked list
        
        if (index == 0){
            this.head = head.next;
            return true;
        }

        LinkedListItem prev = null;
        LinkedListItem cur = head;  // point to node at index
        int i = 0;

        while (i < index && cur != null){            
            prev = cur;
            cur = cur.next;
            i++;
        }


        if (cur == null) return false;  // trying to delete at null node

        prev.next = cur.next;

        return true;
    }

}
