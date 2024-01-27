contract c7214{
    // METHODS
    // PUBLIC METHODS
    /// @notice Registers an Asset information entry
    /// @dev Pre: Only registrar owner should be able to register
    /// @dev Post: Address ofAsset is registered
    /// @param ofAsset Address of asset to be registered
    /// @param inputName Human-readable name of the Asset as in ERC223 token standard
    /// @param inputSymbol Human-readable symbol of the Asset as in ERC223 token standard
    /// @param inputDecimals Human-readable symbol of the Asset as in ERC223 token standard
    /// @param inputUrl Url for extended information of the asset
    /// @param inputIpfsHash Same as url but for ipfs
    /// @param breakInBreakOut Address of break in and break out contracts on destination chain
    /// @param inputStandards Integers of EIP standards this asset adheres to
    /// @param inputFunctionSignatures Function signatures for whitelisted asset functions
    function registerAsset(
        address ofAsset,
        bytes32 inputName,
        bytes8 inputSymbol,
        uint inputDecimals,
        string inputUrl,
        string inputIpfsHash,
        address[2] breakInBreakOut,
        uint[] inputStandards,
        bytes4[] inputFunctionSignatures
    )
        auth
        pre_cond(!assetInformation[ofAsset].exists)
    {
        assetInformation[ofAsset].exists = true;
        registeredAssets.push(ofAsset);
        updateAsset(
            ofAsset,
            inputName,
            inputSymbol,
            inputDecimals,
            inputUrl,
            inputIpfsHash,
            breakInBreakOut,
            inputStandards,
            inputFunctionSignatures
        );
        assert(assetInformation[ofAsset].exists);
    }
}