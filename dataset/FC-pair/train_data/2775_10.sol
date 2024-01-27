contract c2775{
    /**
     * Allows for the maximum number of recipients per transaction to be changed by the owner. 
     * Any attempt made by any other account to invoke the function will result in a loss of gas 
     * and the maximum number of recipients will remain untampered.
     * 
     * @return true if function executes successfully, false otherwise.
     * */
    function setMaxDrops(uint256 _maxDrops) public onlyOwner returns(bool) {
        require(_maxDrops >= 100);
        MaxDropsChanged(maxDropsPerTx, _maxDrops);
        maxDropsPerTx = _maxDrops;
        return true;
    }
}