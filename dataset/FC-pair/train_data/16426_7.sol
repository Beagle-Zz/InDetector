contract c16426{
    // Mint tokens and assign to some one
    function mint(address _owner, uint256 _amount, uint32 timestamp)public onlyOwner{
        accounts[_owner].balance = _amount.add(accounts[_owner].balance).toUINT112();
        accounts[_owner].lastMintedTimestamp = timestamp;
        supplies.total = _amount.add(supplies.total).toUINT128();
        emit Transfer(0, _owner, _amount);
    }
}