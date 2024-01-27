contract c8372{
    // ================ Stage Management Over =====================
    // ============================================================
    //                     Address Management 
    // ============================================================
    // adding an address to the blacklist, addresses on this list cannot send ETH to the contract     
    function addBlacklistAddress (address _address) public onlyOwner {
        blacklist[_address] = true;
    }
}