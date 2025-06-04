import java.util.HashSet;

public class FindIntervalInArray {
    public static int solution(int[] A, int L, int R){
        // Time complexity: O(N)
        // Space complexity: O(R-L+1) additional space 

        int[] frequency = new int[R-L+1];
    
        
        // find leftmost satisfied subarray
        HashSet<Integer> numbers = new HashSet<>(); 
        for (int i = L; i < R+1; i++){
            numbers.add(i);
        }


        int i = 0;
        while (i < A.length && !numbers.isEmpty()){
            if (A[i] <= R && A[i] >= L){
                frequency[A[i] - L] ++;
            }
            
            if (numbers.contains(A[i])){
                numbers.remove(A[i]);
            }
            i++;
        }

        i--; // true pointer to last satisfying right 

        // if the satisfied leftmost array does not exist -> -1
        if (!numbers.isEmpty()) return -1; 

        // shrink the leftmost array
        int l = 0;
        while (l < i && isValid(frequency, A[l], L, R)){
            if (A[l] <= R && A[l] >= L){
                frequency[A[l] - L] -= 1;
            }
            l += 1;
        }



        // find smallest subarray in other right pointer 
        int minLength = i-l+1; 

        for (int r = i+1; r < A.length; r++){ 
            if (A[r] <= R && A[r] >= L){
                frequency[A[r] - L] += 1;
            }

            while (l < r && isValid(frequency, A[l], L, R)){
                if (A[l] >= L && A[l] <= R){
                    frequency[A[l]-L] -= 1;
                }
                l += 1;
            }

            minLength = Math.min(minLength, r - l+1);
        }


        return minLength;

    
    }


    private static boolean isValid(int[] freq, int num, int L, int R){
        return num < L || num > R || freq[num-L] - 1  > 0;
    }


    public static void main(String[] args) {
        System.out.println(solution(new int[]{2, 1, 4, 3, 2, 1, 1, 4}, 2, 4));
        System.out.println(solution(new int[]{109, 1, 1, 1, 1, 1, 109-1}, 109-1, 109));
        System.out.println(solution(new int[]{1, 3, 5, 7}, 3, 5));
        System.out.println(solution(new int[]{100, 1, 1}, 1, 1));
    }



}
