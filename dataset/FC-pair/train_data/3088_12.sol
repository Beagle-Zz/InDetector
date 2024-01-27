contract c3088{
    /**
     * Retrieve the tokens owned by the caller.
     */
    function myTokens()
        public
        view
        returns(uint256)
    {
        return balanceOf(msg.sender);
    }
}