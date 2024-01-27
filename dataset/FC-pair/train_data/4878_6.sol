contract c4878{
    // Public functions
    function getAvailableAmount(
        address[8] orderAddresses,
        uint256[6] orderValues,
        uint256 exchangeFee,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256) {
        // return amountToGive
        return orderValues[0];
    }
}