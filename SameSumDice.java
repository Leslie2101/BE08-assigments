import java.util.Arrays;

public class SameSumDice {
    public static int solution(int[] A, int[] B){        
        // not possible if possible values of A and B not overlap
        if (A.length > B.length*6 || B.length > A.length*6){
            return -1;
        }

        
        int sumA = 0;
        int sumB = 0;

        for (int a: A){
            sumA += a;
        }

        for (int b: B){
            sumB += b;
        }

        // now consider A is always the bigger sum, B is the smaller sum
        if (sumA < sumB){
            int tmp = sumA;
            sumA = sumB;
            sumB = tmp;

            int[] tmpArr = A;
            A = B;
            B = tmpArr;
            
        }

        // greedy flip the dice to allow [lowerA, upperA] and [lowerB, upperB] overlap (so that A = B is possible by current dice)
        // greedy flip by flipping largest dice in A to lower the A value range, or choosing smallest dice in B to increase B value range
        // prioritise which bring larger impact (more reduction from A or more increase from B)
        int lowerA = sumA;
        int upperB = sumB;

        Arrays.sort(A);
        Arrays.sort(B);

        int i = A.length-1;  // index of next flip dice in A
        int j = 0;  // index of next flip dice in B
        int flip = 0;
        while (lowerA > upperB){
        
            if ((j >= B.length) || (i >= 0 && A[i] > 1 && A[i] - 1 > 6 - B[j])){
                lowerA = lowerA - (A[i] - 1);  // flip A[i] to 1
                i--; 
            } else {
                upperB = upperB + (6 - B[j]);  // flip B[j] to 6
                j++;
            }

            flip++;


        }

        return flip;

        // time complexity: O(AlogA + BlogB + A + B) = O(AlogA + BlogB)  where A is size of int[] A and B is size of int[] B


    }


    public static void main(String[] args) {
        System.out.println(solution(new int[]{5}, new int[]{1, 1, 6}));             // 1
        System.out.println(solution(new int[]{2, 3, 1, 1, 2}, new int[]{5, 4, 6})); // 2
        System.out.println(solution(new int[]{5, 4, 1, 2, 6, 5}, new int[]{2}));    // 6
        System.out.println(solution(new int[]{1, 2, 3, 4, 3, 2, 1}, new int[]{6})); // -1
        System.out.println(solution(new int[]{1, 1}, new int[]{6, 6, 6}));  // 4 - flip 2 dices each array
    }
}
