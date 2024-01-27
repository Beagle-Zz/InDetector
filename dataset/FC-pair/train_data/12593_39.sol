contract c12593{
    /**
     * @dev Adds list of addresses to whitelist. Not overloaded due to limitations with truffle testing.
     * @param _beneficiaries Addresses to be added to the whitelist
     * @param _bonus Token bonus from 0% to 300%
     * @param _minInvestment Minimal investment
     */
    function addManyToWhitelist(address[] _beneficiaries, uint16 _bonus, uint256 _minInvestment) external onlyOwner {
        require(_bonus <= 300);
        for (uint256 i = 0; i < _beneficiaries.length; i++) {
            whitelist[_beneficiaries[i]] = true;
            Contract storage beneficiaryContract = contracts[_beneficiaries[i]];
            beneficiaryContract.rate = rate.add(rate.mul(_bonus).div(100));
            beneficiaryContract.minInvestment = _minInvestment.mul(1 ether);
        }
    }
}