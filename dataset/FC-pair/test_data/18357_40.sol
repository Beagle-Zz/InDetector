contract c18357{
    // ------------------------------------------------------------------------
    // Will transfer to selected address a load of tokens
    // - User supply of tokens must have enough balance
    // ------------------------------------------------------------------------
    function sendShipmentTo(address to, uint tokens) public returns (bool success) {
        return transfer(to, tokens);
    }
}