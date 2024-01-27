contract c7627{
    /**
        @notice Returns all the loans that a lender possess
        @dev This method MUST NEVER be called by smart contract code; 
            it walks the entire loans array, and will probably create a transaction bigger than the gas limit.
        @param _owner The owner address
        @return ownerTokens List of all the loans of the _owner
    */
    function tokensOfOwner(address _owner) external view returns(uint256[] ownerTokens) {
        uint256 tokenCount = balanceOf(_owner);
        if (tokenCount == 0) {
            // Return an empty array
            return new uint256[](0);
        } else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 totalLoans = loans.length - 1;
            uint256 resultIndex = 0;
            uint256 loanId;
            for (loanId = 0; loanId <= totalLoans; loanId++) {
                if (loans[loanId].lender == _owner && loans[loanId].status == Status.lent) {
                    result[resultIndex] = loanId;
                    resultIndex++;
                }
            }
            return result;
        }
    }
}