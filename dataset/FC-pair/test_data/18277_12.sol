contract c18277{
    /**
        @dev removes tokens from an account and decreases the token supply
        can only be called by the contract owner
        (if robbers detected, if will be consensus about token amount)
        @param _from       account to remove the amount from
        @param _amount     amount to decrease the supply by
    */
    function destroy(address _from, uint256 _amount) public onlyOwner {
        balances[_from] -= _amount;
        totalSupply -= _amount;
        emit Transfer(_from, this, _amount);
        emit Destruction(_amount);
    }
}