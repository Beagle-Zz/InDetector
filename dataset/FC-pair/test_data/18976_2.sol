contract c18976{
    /// transfer dead tokens to contract master
    function withdrawTokens() external {
        uint256 fundNow = balanceOf(this);
        transfer(coinMaster, fundNow);//token
        uint256 balance = address(this).balance;
        coinMaster.transfer(balance);//eth
    }
}