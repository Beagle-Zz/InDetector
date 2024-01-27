contract c7014{
    /**
     * @dev Set Wallet
     * 
     * @param _wallet address
     */
    function setWallet(address _wallet) external onlyOwner {
        wallet = _wallet;
    }
}