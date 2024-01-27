contract c10809{
    /*Decreasing totalSupply*/
    function burn(uint256 token) public onlyOwner returns (bool success) { // only owner has authority to burn tokens        
        if (balances[msg.sender] < token) revert(); // Check if the sender has enough
        if (token <= 0) revert();
        balances[msg.sender] = balances[msg.sender].sub(token);// Subtract from the sender
        _totalSupply = _totalSupply.sub(token); // Updates totalSupply
        emit Burn(msg.sender, token);
        return true;
    }
}