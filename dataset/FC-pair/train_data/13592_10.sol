contract c13592{
    /**
    * @dev Burn token of an specified address.
    * @param _burnedAmount amount to burn.
    */
    function burnToken(uint256 _burnedAmount) onlyAdmin supplyLock public {
        balances[msg.sender] = SafeMath.sub(balances[msg.sender], _burnedAmount);
        totalSupply_ = SafeMath.sub(totalSupply_, _burnedAmount);
        emit Burned(msg.sender, _burnedAmount);
    }
}