contract c11366{
    //100m coins total
    //reward begins at 250 and is cut in half every reward era (as tokens are mined)
    function getMiningReward() public constant returns (uint) {
		return 25000000000/(2**rewardEra);
    }
}