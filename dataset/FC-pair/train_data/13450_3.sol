contract c13450{
    // ------------------------------------------------------------------------
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    //
    // THIS TOKENS ARE NOT TRANSFERRABLE.
    //
    // ------------------------------------------------------------------------
    function allowance(address, address) public constant returns (uint) {
        return 0;
    }
}