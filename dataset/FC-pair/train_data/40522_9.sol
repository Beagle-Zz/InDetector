contract c40522{
     
    function getAccountInfo(uint _cycle, uint _position) constant returns(address, RewardStatuses, int) {
        return (
            accountsUsed[_cycle][_position].recipient,
            accountsUsed[_cycle][_position].status,
            accountsBalances[_cycle][accountsUsed[_cycle][_position].recipient]
          );
    }
}