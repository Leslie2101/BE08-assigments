public class OptimizingFurthestDistance {
    public int solution(int[] A){
        // find furthest distance between 2 non-equal numbers 

        int N = A.length;
        int result = 0;
        for (int i = 0; i < N; i++){
            for (int j = i; j < N; j++){
                if (A[i] != A[j]){
                    result = Math.max(result, j-i);
                }
            }
        }


        return result;
    }
    
}
