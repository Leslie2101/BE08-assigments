public class PublicTransportTicket {
    public static int solution(int[] A){

        class State {
            int cost;
            int dayRemain;

            public State(int cost, int dayRemain){
                this.cost = cost;
                this.dayRemain = dayRemain;
            }
        }

        State nullState = new State(25, -1);

        int[] COSTS = new int[]{0, 2, 7};
        int[] TICKET = new int[]{0, 1, 7};


        State[][] dp = new State[A.length][3];


        // dp[i][j] = (minimum cost, free remaining days) at day A[i] with ticket j
        // j = 0: no ticket bought, j = 1: 1-day ticket, j = 2: 7-day ticket
     
        dp[0][0] = nullState;
        
        // buy 1-day ticket on first day
        dp[0][1] = new State(2, 0);


        // buy 7-day ticket on first day
        dp[0][2] = new State(7, 6);


        for (int i = 1; i < A.length; i++){

            dp[i][0] = dp[i][1] = dp[i][2] = nullState;

            // free possible? - from dp[i-1][2] and dp[i-1][0]
            if (A[i] - A[i-1] <= dp[i-1][0].dayRemain) {
                dp[i][0] = new State(dp[i-1][0].cost, dp[i-1][0].dayRemain - (A[i] - A[i-1]));
            } else if (A[i] - A[i-1] <= dp[i-1][2].dayRemain) {
                dp[i][0] = new State(dp[i-1][2].cost, dp[i-1][2].dayRemain - (A[i] - A[i-1]));
            } 

            // buy new ticket 

            // j = 1: 1-day ticket, j =2: 7-day ticket
            for (int j = 1; j < 3; j++){

                for (int k = 0; k < 3; k++){
                    if (dp[i-1][k] != nullState && dp[i-1][k].cost + COSTS[j] < dp[i][j].cost){
                        dp[i][j] = new State(dp[i-1][k].cost + COSTS[j], TICKET[j] - 1);
                    }
                }
            }

        }


        int minimumCost = 25;

        for (int i = 0; i < 3; i++){
            // System.out.println(dp[1][i].cost);
            if (minimumCost > dp[A.length-1][i].cost){
                minimumCost = dp[A.length-1][i].cost;
            }
        }

        return minimumCost;
    }


    public static void main(String[] args) {
        System.out.println(solution(new int[]{1, 2, 4, 5, 7, 29, 30}));
    }







}

