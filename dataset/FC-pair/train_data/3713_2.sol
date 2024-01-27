contract c3713{
    // Only to be called by Owner of this contract
    // @param _id Id of lock wallet address
    // @param _walletAddress Address of lock wallet
    function addWalletAddresses(uint _id, address _walletAddress) onlyOwner external{
        require(_walletAddress != address(0));
        walletAddresses[_id] = _walletAddress;
    }
}