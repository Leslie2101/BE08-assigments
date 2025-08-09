public class OptimizingFurthestDistance {
    public int solution(int[] A){
        // Time complexity: O(N)
        // Space complexity: O(1) additional space 

        // find furthest distance between 2 non-equal numbers 
        int N = A.length;


        // first possible value: A[0] with A[i] where i is as high as possible
        int result = 0;

        for (int i = N-1; i >= 0; i--){
            if (A[i] != A[0]){
                result = Math.max(i+1, result);
                break;
            }
        }


        // second possible case: A[N-1] with A[i] where i is as low as possible
        for (int i = 0; i < N; i++){
            if (A[i] != A[N-1]){
                result = Math.max(N-i, result);
                break;
            }
        }


        return result;
    }
    
}
