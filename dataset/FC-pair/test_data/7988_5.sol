contract c7988{
    //86m tokens total
    //reward begins at 86 and is cut in half every reward era (as tokens are mined)
    function getMiningReward() public constant returns (uint) {
        //once we get half way thru the coins, only get 43 per block
         //every reward era, the reward amount halves.
         return (86 * 10**uint(decimals) ).div( 2**rewardEra ) ;
    }
}