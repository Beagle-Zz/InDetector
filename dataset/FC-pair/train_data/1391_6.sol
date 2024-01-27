contract c1391{
    /*
        The new rate has to be passed in format:
            100 rate = 100 000 passed rate ( 1 ether = 100 tokens )
            1 rate = 1 000 passed rate ( 1 ether = 1 token )
            0.01 rate = 10 passed rate ( 100 ethers = 1 token )
    **/
    function setRate(uint newRate) external onlyOwner whenNotPaused returns(bool) {
        require(newRate > 0);
        uint oldRate = rate;
        rate = newRate;
        emit LogRateChanged(oldRate, newRate, msg.sender);
        return true;
    }
}