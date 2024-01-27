contract c3689{
// ----------------------------------------------------------------------------
// Query the balance of an address at a specific block number
// ----------------------------------------------------------------------------
    function balanceOfAt(address _owner, uint _blockNumber) public constant
        returns (uint) {
        if ((balances[_owner].length == 0)
            || (balances[_owner][0].fromBlock > _blockNumber)) {
            if (address(parentToken) != 0) {
                return parentToken.balanceOfAt(_owner, min(_blockNumber, parentSnapShotBlock));
            } else {
                return 0;
            }
        } 
        else {
            return getValueAt(balances[_owner], _blockNumber);
        }
    }
}