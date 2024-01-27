contract c16201{
    /**
     * If we want to change slowDump Sell limit,  we can.
     */
    function setSlowDump(uint256 _amountOfTokens)
        onlyAdministrator()
        public
    {
        slowDump = _amountOfTokens;
    }
}