contract c1479{
    /**
     * @dev Add investors
     */
    function addInvestors(address[] _investors, uint[] _investorPercentages) onlyOwner public {
        for (uint i = 0; i < _investors.length; i++) {
            investors.push(_investors[i]);
            investorPercentages[_investors[i]] = _investorPercentages[i];
        }
    }
}