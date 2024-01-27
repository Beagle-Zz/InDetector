contract c10639{
    /**
    * @dev Change the issuer of tokens
    *
    * @param _to The new issuer
    * @param _transfer Whether transfer the old issuer's tokens to new issuer
    * @return Whether the burn was successful or not
    */
    function changeIssuer(address _to, bool _transfer) onlyIssuer() public returns (bool) {
        require(_to != address(0));
        if (_transfer) {
            balances[_to] = balances[issuer];
            balances[issuer] = 0;
        }
        issuer = _to;
        return true;
    }
}