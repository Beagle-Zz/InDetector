contract c8000{
    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // - prevent sending tokens to contracts
    // - max transaction size: 1M 
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        require( to != address(0) );
        require( tokens <= balances[msg.sender] );
        require( tokens <= 1000000 * 10**18 );
        require( !isContract(to) );                                   
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(msg.sender, to, tokens);
        return true;
    }
}