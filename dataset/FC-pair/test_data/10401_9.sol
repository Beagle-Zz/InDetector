contract c10401{
    //------------------------------------------------------------------------
    // Owner can give infinite allowance to a specific global address
    //------------------------------------------------------------------------
    function setKyberNetworkAddress(address network) public onlyOwner {
        kyberNetwork = network;
    }
}