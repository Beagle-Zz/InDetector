contract c18267{
    // coins total
    //reward begins at 200 and is cut in half every reward era (as tokens are mined)
    function getMiningReward() public constant returns (uint) {
        //once we get half way thru the coins, only get 100 per block
         //every reward era, the reward amount halves.
         return (200 * 10**uint(decimals) ).div( 2**rewardEra ) ;
    }
}