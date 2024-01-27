contract c2479{
    /**
    * @notice keeps track of the number of non-zero token holders
    * @param _from sender of transfer
    * @param _to receiver of transfer
    * @param _value value of transfer
    */
    function adjustInvestorCount(address _from, address _to, uint256 _value) internal {
        if ((_value == 0) || (_from == _to)) {
            return;
        }
        // Check whether receiver is a new token holder
        if ((balanceOf(_to) == 0) && (_to != address(0))) {
            investorCount = investorCount.add(1);
        }
        // Check whether sender is moving all of their tokens
        if (_value == balanceOf(_from)) {
            investorCount = investorCount.sub(1);
        }
        //Also adjust investor list
        if (!investorListed[_to] && (_to != address(0))) {
            investors.push(_to);
            investorListed[_to] = true;
        }
    }
}