contract c16077{
    /**
     * @dev Add collecting wallet address to the list
     * @param _address Address of the wallet
     */
    function addWallet(address _address) public onlyOwner {
        require(_address != address(0));
        for (uint256 i = 0; i < wallets.length; i++) {
            require(_address != wallets[i]);
        }
        wallets.push(_address);
        emit WalletAdded(_address);
    }
}