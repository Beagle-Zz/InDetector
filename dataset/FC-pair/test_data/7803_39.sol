contract c7803{
    //owner is able to change rate in case of big price fluctuations of ether (on the market)
    function _changeRate(uint256 _rate) public onlyOwner {
        require(_rate > 0);
        rate = _rate;
    }
}