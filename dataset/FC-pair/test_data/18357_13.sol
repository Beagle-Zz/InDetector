contract c18357{
    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ETH
    // ------------------------------------------------------------------------
    function recoverLostEth(address toAddress, uint value) public onlyOwner returns (bool success) {
        toAddress.transfer(value);
        return true;
    }
}