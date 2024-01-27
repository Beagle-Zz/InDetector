contract c4902{
    /// @dev Guards functions only for distributionSource invocations
    modifier onlyDistributionSource {
        if (!distributionSourcesList[msg.sender]) {
            revert();
        }
        _;
    }
}