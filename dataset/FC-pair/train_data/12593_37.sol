contract c12593{
    /**
     * @dev Reverts if beneficiary is not invests minimal ether amount.
     */
    modifier isMinimalInvestment(address _beneficiary, uint256 _weiAmount) {
        require(_weiAmount >= contracts[_beneficiary].minInvestment);
        _;
    }
}