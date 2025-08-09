import java.util.Arrays;

public class PublicTransportTicket {
    public static int solution(int[] A){


        int[] dp = new int[A.length+1];


        for (int i = 1; i < A.length + 1; i++){
            // valid from buying ticket 1-day 
            dp[i] = dp[i-1] + 2;

            // valid from buying ticket 7-day previously (note that A[j] is the last valid day)
            for (int j = i-1; j == 0 || (j-1 >= 0 && A[i-1] - A[j-1] <= 7); j--){
                dp[i] = Math.min(dp[i], dp[j] + 7);
            }


            // System.out.println("i " + i +  " days " + A[i-1] + ", " + dp[i]);

        }

        // System.out.println(Arrays.toString(dp));


        return Math.min(dp[A.length], 25);
    }


    public static void main(String[] args) {
        System.out.println(solution(new int[]{1, 2, 4, 5, 7, 29, 30}));
    }







}

