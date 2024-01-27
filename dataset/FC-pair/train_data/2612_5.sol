contract c2612{
    /**
     * Address of game contract that ETH gets sent to
     */
    function assignedDoublrContract() 
    public 
    view 
    returns (address)
    {
        return address(doublr);
    }
}