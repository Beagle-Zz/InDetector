contract c2022{
    /**
        @dev Set the wallet address to receive the crowdsale contributions
        @param _wallet The wallet address
     */
    function setEthWallet(address _wallet) public onlyOwner() {
        wallet = _wallet;
    }
}