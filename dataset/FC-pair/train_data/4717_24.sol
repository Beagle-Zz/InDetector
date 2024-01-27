contract c4717{
    /**
     * @dev Transfer the same amount of tokens to multiple beneficiaries 
     * @param _beneficiaries addresses of the beneficiaries
     * @param _amounts uint256[] amounts for each beneficiary
     */
    function allocateEqual(address[] _beneficiaries, uint256 _amounts) public onlyOwner {
        uint256 totalAmount = _amounts.mul(_beneficiaries.length);
        require(totalAllocated.add(totalAmount) <= cap);
        require(token.balanceOf(this) >= totalAmount);
        for (uint256 i = 0; i < _beneficiaries.length; i ++) {
            token.safeTransfer(_beneficiaries[i], _amounts);
            totalAllocated.add(_amounts);
        }
    }
}