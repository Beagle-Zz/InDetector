contract c7606{
    /**
     * withdraw ether
     */
    function withdrawEth() public onlyOwner {
        teamWallet.transfer(address(this).balance);
    }
}