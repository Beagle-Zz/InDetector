contract c40522{
     
    function getRewardsCount(uint _cycle) constant returns(uint) {
        return accountsUsed[_cycle].length;
    }
}