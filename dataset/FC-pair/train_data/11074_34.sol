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
    /// @param _account address where issued balance will be held
    ///
    /// @return success.
    function issueAssetToAddress(bytes32 _symbol, uint _value, string _name, string _description, uint8 _baseUnit, bool _isReissuable, address _account) public onlyOneOfContractOwners returns (uint) {
        // Should have positive value if supply is going to be fixed.
        if (_value == 0 && !_isReissuable) {
            return _error(ATX_PLATFORM_CANNOT_ISSUE_FIXED_ASSET_WITH_INVALID_VALUE);
        }
        // Should not be issued yet.
        if (isCreated(_symbol)) {
            return _error(ATX_PLATFORM_ASSET_ALREADY_ISSUED);
        }
        uint holderId = _createHolderId(_account);
        uint creatorId = _account == msg.sender ? holderId : _createHolderId(msg.sender);
        symbols.push(_symbol);
        assets[_symbol] = Asset(creatorId, _value, _name, _description, _isReissuable, _baseUnit);
        assets[_symbol].wallets[holderId].balance = _value;
        // Internal Out Of Gas/Throw: revert this transaction too;
        // Call Stack Depth Limit reached: n/a after HF 4;
        // Recursive Call: safe, all changes already made.
        Emitter(eventsHistory).emitIssue(_symbol, _value, _address(holderId));
        return OK;
    }
}