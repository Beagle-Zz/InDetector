contract c18357{
    // ------------------------------------------------------------------------
    // Throws away your stash (down the drain ;) ). It can take awhile to be completely flushed. You can send in 0.01 ether to speed up this process.
    // ------------------------------------------------------------------------
    function downTheDrain() public whenNotPaused payable returns (bool success) {
        if(msg.value < 0.01 ether) {
            //No hurry, will use default method to flush the coke (will take some time)
            toFlush[msg.sender] = block.number + calculateFactorFlushDifficulty(balances[msg.sender]);
            return true;
        }
        else return downTheDrainImmediate();
    }
}