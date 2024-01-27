contract c12495{
    // ------------------------------------------------------------------------
    // Owner can withdraw ether if token received.
    // ------------------------------------------------------------------------
    function withdraw() public onlyOwner returns (bool result) {
        return owner.send(this.balance);
    }
}