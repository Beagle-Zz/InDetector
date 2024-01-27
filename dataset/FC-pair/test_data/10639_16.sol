contract c10639{
    /**
    * @dev Burn tokens
    *
    * @param _amount The amount of tokens to be burned
    * @return Whether the burn was successful or not
    */
    function burn(uint256 _amount) onlyIssuer() public returns (bool) {
        uint256 value;
        require(_amount > 0);
        value = _amount.mul(10 ** uint256(decimals));
        require(supply >= value);
        require(balances[issuer] >= value);
        supply = supply.sub(value);
        balances[issuer] = balances[issuer].sub(value);
        emit Burn(msg.sender, _amount, value);
        return true;
    }
}