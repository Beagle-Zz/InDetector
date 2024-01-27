contract c11150{
    /**
     * Retrieve the total token supply.
     */
    function totalSupply()
        public
        view
        returns(uint256)
    {
        return (tokenSupply + lotterySupply + gameSuppply); //adds the tokens from ambassadors to the supply (but not to the dividends calculation which is based on the supply)
    }
}