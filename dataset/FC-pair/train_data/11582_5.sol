contract c11582{
    //84 m coins total
    //reward begins at 50 and is cut in half every reward era (as tokens are mined)
    function getMiningReward() public constant returns (uint) {
        //once we get half way thru the coins, only get 25 per block
         //every reward era, the reward amount halves.
         return (50 * 10**uint(decimals) ).div( 2**rewardEra ) ;
    }
}