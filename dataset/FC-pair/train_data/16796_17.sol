contract c16796{
    /**
        @dev increases the token supply and sends the new tokens to an account
        can only be called by the contract owner
        @param _to         account to receive the new amount
        @param _amount     amount to increase the supply by
    */
    function issue(address _to, uint256 _amount)
        public
        ownerOnly
        validAddress(_to)
        notThis(_to)
    {
        totalSupply = safeAdd(totalSupply, _amount);
        balanceOf[_to] = safeAdd(balanceOf[_to], _amount);
        Issuance(_amount);
        Transfer(this, _to, _amount);
    }
}