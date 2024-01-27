contract c3786{
    // Alters the amount of tokens allocated to a game contract on a daily basis.
    function alterTokenGrant(address _contract, uint _newAmount)
        public
        isAnOwner
        contractIsWhiteListed(_contract)
    {
        dailyTokensPerContract[_contract] = _newAmount;
    }
}