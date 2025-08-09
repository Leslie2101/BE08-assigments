
public class SixDigit {

    public static String solution(int A, int B, int C, int D, int E, int F){
        // greedy: pick the largest as furthest (second, minutes, then hour)

        int[] freq = new int[10];
        freq[A] += 1;
        freq[B] += 1;
        freq[C] += 1;
        freq[D] += 1;
        freq[E] += 1;
        freq[F] += 1;

        
        int k = 5;
        int[] timeSlots = new int[]{-1, -1, -1, -1, -1, -1};

        // assign numbers from 6 to 9 at 2nd slot of each hour/minute/second first
        for (int i = 9; i > 5; i--){
            for (int j = 0; j < freq[i]; j++){
                if (k < 0) return "NOT POSSIBLE";
                timeSlots[k] = i;
                k -= 2;

                
            }

            
        }

        k = 0;

        // System.out.println(timeSlots);

        // for 1...5, assign smallest to remaining slot from left to right
        for (int i = 0; i < 6; i++){

            for (int j = 0; j < freq[i]; j++){
                while (k < 6 && timeSlots[k] > -1) {
                    k += 1;
                }

                timeSlots[k] = i;

            }

        }

        // verify time format 
        if (timeSlots[0] * 10 + timeSlots[1] > 23 || timeSlots[2]*10+ timeSlots[3] > 59 || timeSlots[4]*10+ timeSlots[5] > 59) {
            return "NOT POSSIBLE";
        }

        // System.out.println(timeSlots[3]);
        return "" + timeSlots[0] + timeSlots[1] +":" + timeSlots[2]+ timeSlots[3] +":" + timeSlots[4] + timeSlots[5];

    }

    
    
    public static void main(String[] args) {
        System.out.println(solution(1, 7, 3, 4, 8, 9));
        System.out.println(solution(4, 4, 6, 6, 9, 9));
        System.out.println(solution(2, 3, 4, 5, 6, 6));
        System.out.println(solution(1, 3, 5,8, 8, 9));


    }
}
