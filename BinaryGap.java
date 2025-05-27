public class BinaryGap {
    public static int solution(int n){
        
        int longestGap = 0;
        int oneIndex = -1;
        int i = 0;

        while (n != 0){

            if (n % 2 != 0){
                // compute gap = current one index - previous one index - 1
                if (oneIndex != -1){
                    longestGap = Math.max(longestGap, i - oneIndex - 1);
                }
                oneIndex = i;
            }

            n /= 2;
            i++;
        }
    

            
        return longestGap;

        // time complexity: O(logN) (specifically O(log(2,N))
    }

    public static void main(String[] args) {
        System.out.println(solution(1041));//5: longest gap at left end  (2^10 + 2^4 + 2^0)
        System.out.println(solution(193)); //5: longest gap at right end  (2^7 + 2^6 + 2^0)
        System.out.println(solution(166)); //2: longest gap at middle (2^7 + 2^5 + 2^2 + 2^1)
        System.out.println(solution(32));  //0: no gap 

    }
}
