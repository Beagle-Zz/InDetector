contract c18261{
    /**
     * @dev Del address from limitedWallets
     * @dev Can be called only by manager
     */
    function delLimitedWalletAddress(address _wallet) public onlyManager {
        limitedWallets[_wallet] = false;
    }
}