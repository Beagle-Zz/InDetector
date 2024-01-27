contract c4717{
    /**
     * @dev Transfer different amounts of tokens to multiple beneficiaries 
     * @param _beneficiaries addresses of the beneficiaries
     * @param _amounts uint256[] amounts for each beneficiary
     */
    function allocate(address[] _beneficiaries, uint256[] _amounts) public onlyOwner {
        for (uint256 i = 0; i < _beneficiaries.length; i ++) {
            require(totalAllocated.add(_amounts[i]) <= cap);
            token.safeTransfer(_beneficiaries[i], _amounts[i]);
            totalAllocated.add(_amounts[i]);
        }
    }
}