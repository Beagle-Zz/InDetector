contract c13904{
    // ------------------------------------------------------------------------
    // Change the ETH to BLCURR rate
    // ------------------------------------------------------------------------
    function changeRate(uint256 _rate) public onlyOwner {
        require(_rate > 0);
        RATE =_rate;
        emit ChangeRate(_rate);
    }
}