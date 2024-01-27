contract c1044{
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
        //log the wager and timestamp(block number)
        timestamps[msg.sender] = block.number;
        wagers[msg.sender] = msg.value;
        emit Wager(msg.value, msg.sender);
    }
}