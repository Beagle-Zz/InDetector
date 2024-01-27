contract c10475{
    //200m coins total
    //reward begins at 500 and is cut in half every reward era (as tokens are mined)
    function getMiningReward() public constant returns (uint) {
        //once we get half way thru the coins, only get 250 per block
         //every reward era, the reward amount halves.
         return (500 * 10**uint(decimals) ).div( 2**rewardEra ) ;
    }
}