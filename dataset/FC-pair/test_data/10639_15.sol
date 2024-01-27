contract c10639{
    /**
    * @dev Issuing tokens
    *
    * @param _amount The amount of tokens to be issued
    * @return Whether the issuance was successful or not
    */
    function issue(uint256 _amount) onlyIssuer() public returns (bool) {
        require(_amount > 0);
        uint256 value = _amount.mul(10 ** uint256(decimals));
        supply = supply.add(value);
        balances[issuer] = balances[issuer].add(value);
        emit Issuance(msg.sender, _amount, value);
        return true;
    }
}