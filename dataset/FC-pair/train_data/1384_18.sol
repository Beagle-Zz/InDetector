contract c1384{
    /*
        By default minWeiAmount = 1000
        With min wei amount we can set the rate to be a float number
        We use it as a multiplier because we can not pass float numbers in ethereum
        If the token price becomes bigger than ether one, for example -> 1 token = 10 ethers
        We will pass 100 as rate and this will be relevant to 0.1 token = 1 ether
    **/
    function setMinWeiAmount(uint newMinWeiAmount) external onlyOwner whenNotPaused returns(bool) {
        require(newMinWeiAmount > 0);
        require(newMinWeiAmount % 10 == 0); 
        uint oldMinWeiAmount = minWeiAmount;
        minWeiAmount = newMinWeiAmount;
        emit LogMinWeiAmountChanged(oldMinWeiAmount, minWeiAmount, msg.sender);
        return true;
    }
}