contract c7627{
    /**
        @notice Used to reference a loan that is not yet created, and by that does not have an index
        @dev Two identical loans cannot exist, only one loan per signature is allowed
        @return The signature hash of the loan configuration
    */
    function buildIdentifier(Oracle oracle, address borrower, address creator, bytes32 currency, uint256 amount, uint256 interestRate,
        uint256 interestRatePunitory, uint256 duesIn, uint256 cancelableAt, uint256 expirationRequest, string metadata) view returns (bytes32) {
        return keccak256(this, oracle, borrower, creator, currency, amount, interestRate, interestRatePunitory, duesIn,
                        cancelableAt, expirationRequest, metadata); 
    }
}