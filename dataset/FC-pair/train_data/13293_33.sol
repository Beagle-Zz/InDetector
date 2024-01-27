contract c13293{
    /**
    * @dev Approves tokens allocated to a beneficiary
    * @param _beneficiary Token purchaser
    */
    function approveAllocation(address _beneficiary) external onlyOwner returns (bool) {
        require(_beneficiary != address(0));
        require(_beneficiary != _founder_one);
        require(_beneficiary != _founder_two);
        require(_beneficiary != _reserve);
        uint256 allocatedTokens = allocated[_beneficiary];
        token.transfer(_beneficiary, allocated[_beneficiary]);
        allocated[_beneficiary] = 0;
        emit AllocationApproved(_beneficiary, allocatedTokens);
        return true;
    }
}