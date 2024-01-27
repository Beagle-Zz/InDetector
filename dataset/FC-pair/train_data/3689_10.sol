contract c3689{
// ----------------------------------------------------------------------------
// Queries the total supply of tokens at a specific block number
// will return 0 if called before the creationBlock value
// ----------------------------------------------------------------------------
    function totalSupplyAt(uint _blockNumber) public constant returns(uint) {
        if (
            (totalSupplyHistory.length == 0) ||
            (totalSupplyHistory[0].fromBlock > _blockNumber)
            ) {
            if (address(parentToken) != 0) {
                return parentToken.totalSupplyAt(min(_blockNumber, parentSnapShotBlock));
            } else {
                return 0;
            }
        } 
        else {
            return getValueAt(totalSupplyHistory, _blockNumber);
        }
    }
}