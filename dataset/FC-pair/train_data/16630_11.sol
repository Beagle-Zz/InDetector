contract c16630{
    /**
    * @dev The new owner accepts the contract transfer request.
    */
    function acceptOwnership() public onlyNewOwner returns(bool) {
        uint256 ownerAmount = _balances[owner];
        _balances[owner] = _balances[owner].sub(ownerAmount);
        _balances[newOwner] = _balances[newOwner].add(ownerAmount);
        emit Transfer(owner, newOwner, ownerAmount);   
        owner = newOwner;
        newOwner = address(0);
        emit OwnershipTransferred(owner, newOwner);
        return true;
    }
}