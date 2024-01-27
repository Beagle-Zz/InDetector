contract c10604{
    /*
        @notice Changes the coldwallet, exceeding funds will be sent here
        @param wallet New coldwallet address
    */
    function setColdWallet(address wallet) public onlyOwner returns (bool) {
        coldWallet = wallet;
        return true;
    }
}