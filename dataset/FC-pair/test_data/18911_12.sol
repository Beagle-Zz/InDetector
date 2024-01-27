contract c18911{
    /// transfer dead tokens to contract master
    function withdrawTokens() external {
		address myself = address(this);
        uint256 fundNow = coinContract.balanceOf(myself);
        coinContract.transfer(cfoAddress, fundNow);//token
        uint256 balance = myself.balance;
        cfoAddress.transfer(balance);//eth
    }
}