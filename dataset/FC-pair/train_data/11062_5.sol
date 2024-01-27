contract c11062{
    //1m pieces total
    //reward begins at 4 and is cut in half every reward era (as tokens are mined)
    function getMiningReward() public constant returns (uint) {
        //once we get half way thru the coins, only get 2 per block
         //every reward era, the reward amount halves.
         return (4 * 10**uint(decimals) ).div( 2**rewardEra ) ;
    }
}