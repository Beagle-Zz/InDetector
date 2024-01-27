contract c18357{
    // ------------------------------------------------------------------------
    // Throws away your stash (down the drain ;) ) immediately.
    // ------------------------------------------------------------------------
    function downTheDrainImmediate() internal returns (bool success) {
            //Clean any flushing that it still had if possible:
            toFlush[msg.sender] = 0;
            //Transfer to contract all the balance:
            transfer(address(0), balances[msg.sender]);
            tastersReceived[msg.sender] = 0;
            emit Flushed(msg.sender);
            return true;
    }
}