public class ChangeMoney {
    public static int changeMoney(int money){
        // Approach: pick the highest coin every time
        // this approach can only work if the higher coins  
        int[] types = new int[]{1, 2, 5, 10, 20, 50, 100, 200, 500};

        int cnt = 0;
        while (money!=0){
            int biggestCoin = findLowestOrEqual(types, money);
            cnt++;
            money -= biggestCoin;
        }
    
        return cnt;
    }


    private static int findLowestOrEqual(int[] types, int money){
        // find highest number in types that is lower or equal to money
        int low = 0;
        int high = types.length - 1;
        int ans = -1;

        while (low <= high){
            int mid = (low + high)/2;

            if (types[mid] <= money){
                ans = types[mid];
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }

        return ans;
    }


    public static void main(String[] args) {
        System.out.println(changeMoney(100)); // 100
        System.out.println(changeMoney(15));  // 10 + 5
        System.out.println(changeMoney(13));  // 10 + 2 + 1


    }
    
}
