contract c3541{
    /// @notice Redeems by allocating an ownership percentage of each asset to the participant
    /// @dev Independent of running price feed!
    /// @param shareQuantity Number of shares owned by the participant, which the participant would like to redeem for individual assets
    /// @return Whether all assets sent to shareholder or not
    function redeemAllOwnedAssets(uint shareQuantity)
        external
        returns (bool success)
    {
        return emergencyRedeem(shareQuantity, ownedAssets);
    }
}