contract c18277{
    /**
        @dev increases the token supply and sends the new tokens to an account
        can only be called by the contract owner
        @param _to         account to receive the new amount
        @param _amount     amount to increase the supply by
    */
    function issue(address _to, uint256 _amount) public onlyOwner {
        require(maxSupply >= totalSupply + _amount);
        totalSupply +=  _amount;
        balances[_to] += _amount;
        emit Issuance(_amount);
        emit Transfer(this, _to, _amount);
    }
}