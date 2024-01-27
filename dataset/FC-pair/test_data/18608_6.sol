contract c18608{
    /**
     * Oyster Protocol Function
     * More information at https://oyster.ws/OysterWhitepaper.pdf
     * 
     * Lock an address
     *
     * When an address is locked; only claimAmount can be withdrawn once per epoch
     */
    function lock(uint256 interval) public returns (bool success) {
        // The address must be previously unlocked
        require(locked[msg.sender] == 0);
        // An address must have at least retentionMin to be locked
        require(balances[msg.sender] >= retentionMin);
        // Prevent addresses with large balances from getting buried
        require(balances[msg.sender] <= retentionMax);
        // Set locked state to true
        locked[msg.sender] = interval;
        // Execute an event reflecting the change
        Lock(msg.sender, balances[msg.sender], interval);
        return true;
    }
}