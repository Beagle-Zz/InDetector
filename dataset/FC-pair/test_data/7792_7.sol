contract c7792{
    // ------------------------------------------------------------------------
    // Owner can withdraw ether if token received.
    // ------------------------------------------------------------------------
    function withdraw() public onlyOwner returns (bool result) {
        address tokenaddress = this;
        return owner.send(tokenaddress.balance);
    }
}