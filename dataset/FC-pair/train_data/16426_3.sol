contract c16426{
    // Transfer the balance from owner's account to another account
    function transfer(address _to, uint256 _amount)public returns (bool success) {
        require(isSealed());
        // according to FFC's total supply, never overflow here
        if ( accounts[msg.sender].balance >= _amount && _amount > 0) {            
            accounts[msg.sender].balance -= uint112(_amount);
            accounts[_to].balance = _amount.add(accounts[_to].balance).toUINT112();
            emit Transfer(msg.sender, _to, _amount);
            return true;
        } else {
            return false;
        }
    }
}