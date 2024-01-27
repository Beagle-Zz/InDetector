contract c13786{
    //21m coins total
    //reward begins at 15 and is cut in half every reward era (as tokens are mined) 
    function getMiningReward() public constant returns (uint) {
        //once we get half way thru the coins, only get 7.5 per block
         //every reward era, the reward amount halves.
         return (15 * 10**uint(decimals) ).div( 2**rewardEra ) ;
    }
}