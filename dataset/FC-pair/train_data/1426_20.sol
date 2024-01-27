contract c1426{
    // unfreeze frozen amount
    // everyone can call this function to unfreeze balance
    function unfreeze(uint256 timestamp) public returns (uint256 unfreezeAmount) {
        require(timestamp <= block.timestamp);
        uint256 unfreezeIndex = uint256(timestamp.parseTimestamp().year) * 10000 + uint256(timestamp.parseTimestamp().month) * 100 + uint256(timestamp.parseTimestamp().day);
        frozenBalance = frozenBalance.sub(frozenRecords[unfreezeIndex].value);
        balances[owner] = balances[owner].add(frozenRecords[unfreezeIndex].value);
        unfreezeAmount = frozenRecords[unfreezeIndex].value;
        emit Unfreeze(owner, unfreezeAmount, timestamp);
        frozenRecords[unfreezeIndex].value = 0;
        return unfreezeAmount;
    }
}