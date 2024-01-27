contract c16415{
    /// @dev Calculates the sum of values already filled and cancelled for a given order.
    /// @param orderHash The Keccak-256 hash of the given order.
    /// @return Sum of values already filled and cancelled.
    function getUnavailableTakerTokenAmount(bytes32 orderHash)
        public
        constant
        returns (uint)
    {
        return safeAdd(filled[orderHash], cancelled[orderHash]);
    }
}