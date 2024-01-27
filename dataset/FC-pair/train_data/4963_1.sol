contract c4963{
    // ------------------------------------------------------------------------
    // Convert you Eth to Metha
    // ------------------------------------------------------------------------
    function convertToMeth() payable public {
        uint tokens = msg.value * eth_meth;
        balances[msg.sender] = balances[msg.sender].add(tokens); // eth wei to meth wei
        _totalSupply = _totalSupply.add(tokens);
    }
}