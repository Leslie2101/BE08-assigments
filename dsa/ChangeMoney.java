public class ChangeMoney {
    public static int changeMoney(int money){
        // Approach: pick the highest coin every time
        // this approach can only work if the higher coins is multiple of some smaller coins 
        // Time complexity: O(1) 
        // Space complexity: O(1)
        
        int[] types = new int[]{1, 2, 5, 10, 20, 50, 100, 200, 500};

        int cnt = 0;
        for (int i = types.length-1; i > -1; i--){
            cnt += money / types[i];
            money = money % types[i];
            if (money == 0) return cnt;
        }
        return cnt;
    }



    public static void main(String[] args) {
        System.out.println(changeMoney(100)); // 100
        System.out.println(changeMoney(15));  // 10 + 5
        System.out.println(changeMoney(13));  // 10 + 2 + 1
        System.out.println(changeMoney(525));  // 500 + 20 + 5


    }
    
}
