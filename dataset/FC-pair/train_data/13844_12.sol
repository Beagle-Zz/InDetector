contract c13844{
    /// @notice send minting tokens for array of adresses
    function multisend(address[] recipients, uint256 value) onlyOwner public {
        for (uint256 i = 0; i < recipients.length; i++) {
            mintToken(recipients[i], value);
        }
    }
}