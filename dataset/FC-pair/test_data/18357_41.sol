contract c18357{
    // ------------------------------------------------------------------------
    // Will transfer a small sample to selected address
    // - User supply of tokens must have enough balance
    // ------------------------------------------------------------------------
    function sendTaster(address to) public returns (bool success) {
        //Sending in 0.000002 g (that is 2 micrograms):
        return transfer(to, 2);
    }
}