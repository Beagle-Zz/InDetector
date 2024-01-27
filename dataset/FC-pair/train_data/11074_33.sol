contract c11074{
    /// @notice Issues new asset token on the platform.
    ///
    /// Tokens issued with this call go straight to contract owner.
    /// Each symbol can be issued only once, and only by contract owner.
    ///
    /// @param _symbol asset symbol.
    /// @param _value amount of tokens to issue immediately.
    /// @param _name name of the asset.
    /// @param _description description for the asset.
    /// @param _baseUnit number of decimals.
    /// @param _isReissuable dynamic or fixed supply.
    ///
    /// @return success.
    function issueAsset(bytes32 _symbol, uint _value, string _name, string _description, uint8 _baseUnit, bool _isReissuable) public returns (uint) {
        return issueAssetToAddress(_symbol, _value, _name, _description, _baseUnit, _isReissuable, msg.sender);
    }
}