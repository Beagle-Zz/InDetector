contract c1034{
    /**
     * Wager your bet
     */
    function wager()
    isOpenToPublic()
    onlyRealPeople() 
    payable
    public 
    {
        //You have to send exactly 0.01 ETH.
        require(msg.value == betLimit);
        //You cannot wager multiple times
        require(wagers[msg.sender] == 0);
        //log the wager and timestamp(block number)
        timestamps[msg.sender] = block.number;
        wagers[msg.sender] = msg.value;
        emit Wager(msg.value, msg.sender);
    }
}