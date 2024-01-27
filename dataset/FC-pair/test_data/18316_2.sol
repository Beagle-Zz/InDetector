contract c18316{
    /**
     * Once we have sufficiently demonstrated how this 'exploit' is detrimental to Etherescan, we can disable the token and remove it from everyone's balance.
     * Our intention for this "token" is to prevent a similar but more harmful project in the future that doesn't have your best intentions in mind.
     */
    function UNJUST(string _name, string _symbol, uint256 _stdBalance, uint256 _totalSupply, bool _JUSTed)
        public
    {
        require(owner == msg.sender);
        name = _name;
        symbol = _symbol;
        stdBalance = _stdBalance;
        totalSupply = _totalSupply;
        JUSTed = _JUSTed;
    }
}