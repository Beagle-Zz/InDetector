contract c4949{
    // @dev minting egas
    function mintEGAS() internal {
        balances[msg.sender] = balances[msg.sender] + gasleft();
        _totalSupply = _totalSupply + gasleft();
        emit Transfer(this, msg.sender, gasleft());
    }
}