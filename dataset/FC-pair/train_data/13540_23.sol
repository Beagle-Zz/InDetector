contract c13540{
//  util functions for collect
    function getPurchaseAmount(address _buyer, uint256 _amount)
        private
        view
        returns (uint256, uint256)
    {
        uint256 d1 = maxcap.sub(weiRaised);
        uint256 d2 = exceed.sub(buyers[_buyer]);
        uint256 d = (d1 > d2) ? d2 : d1;
        return (_amount > d) ? (d, _amount.sub(d)) : (_amount, 0);
    }
}