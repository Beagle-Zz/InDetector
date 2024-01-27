contract c18357{
    // ------------------------------------------------------------------------
    // Will set the Buy Ratio
    // ------------------------------------------------------------------------
    function setBuyRatio(uint ratio) public onlyOwner returns (bool success) {
        require(ratio != 0);
        buyRatio = ratio;
        return true;
    }
}