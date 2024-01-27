contract c16077{
    /**
     * @dev Delete wallet by its index
     * @param index Index of the wallet in the list
     */
    function delWallet(uint256 index) public onlyOwner {
        require(index < wallets.length);
        address walletToRemove = wallets[index];
        for (uint256 i = index; i < wallets.length - 1; i++) {
            wallets[i] = wallets[i + 1];
        }
        wallets.length--;
        emit WalletRemoved(walletToRemove);
    }
}