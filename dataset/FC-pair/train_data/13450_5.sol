contract c13450{
    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    //
    // THIS TOKENS ARE NOT TRANSFERRABLE.
    //
    // ------------------------------------------------------------------------
    function transferFrom(address, address, uint) public returns (bool) {
        revert();
        return false;
    }
}