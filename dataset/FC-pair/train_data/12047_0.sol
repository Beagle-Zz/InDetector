contract c12047{
    // Public functions
    function getAvailableAmount(
        address[8] orderAddresses, // [converterAddress, conversionPath ... ]
        uint256[6] orderValues, // [amountToGive, minReturn, EMPTY, EMPTY, EMPTY, EMPTY]
        uint256 exchangeFee, // ignore
        uint8 v, // ignore
        bytes32 r, // ignore
        bytes32 s // ignore
    ) external returns (uint256) {
        // Return amountToGive
        return orderValues[0];
    }
}