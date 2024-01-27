contract c150{
    /**
     * Retrieve the tokens owned by the caller.
     */
    function myTokens()
    public
    view
    returns (uint256)
    {
        address _customerAddress = msg.sender;
        return getBalance(_customerAddress);
    }
}