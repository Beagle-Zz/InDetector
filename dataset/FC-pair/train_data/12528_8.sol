contract c12528{
    /**
    * @dev Burn token of an specified address.
    * @param _burnedAmount amount to burn.
    */
    function burnToken(uint256 _burnedAmount) onlyAdmin public {
        balances[msg.sender] = SafeMath.sub(balances[msg.sender], _burnedAmount);
        totalSupply = SafeMath.sub(totalSupply, _burnedAmount);
        emit Burned(msg.sender, _burnedAmount);
    }
}