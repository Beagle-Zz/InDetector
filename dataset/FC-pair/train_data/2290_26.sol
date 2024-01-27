contract c2290{
    /**
     * @notice use to verify the investment, whether the investor provide the allowance to the STO or not.
     * @param _beneficiary Ethereum address of the beneficiary, who wants to buy the st-20
     * @param _fundsAmount Amount invested by the beneficiary
     */
    function verifyInvestment(address _beneficiary, uint256 _fundsAmount) public view returns(bool) {
        return polyToken.allowance(_beneficiary, address(this)) >= _fundsAmount;
    }
}