public class CalculateTheSquare {
    public static int solution(int A, int B){
        int count = -1;
        double aFloat = A;
        double bFloat = B;
        while (((int) bFloat > (int) aFloat) || (bFloat == aFloat && bFloat == (int) bFloat)){
            count ++;
            // System.out.println(aFloat + ", " + bFloat);
            bFloat = Math.sqrt(bFloat);
            aFloat = Math.sqrt(aFloat);
        }

        return count;
    
    }

    public static void main(String[] args) {
        System.out.println(solution(2, 2)); // return 0
        System.out.println(solution(10, 20)); // return 2
        System.out.println(solution(6000, 7000)); // return 3

    }
    
    


}
