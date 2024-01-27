contract c3064{
    //freeze account
    function freezeWithTimestamp(address target,uint256 timestamp)public onlyOwner returns (bool) {
        frozenAccount[target] = timestamp;
        return true;
    }
}