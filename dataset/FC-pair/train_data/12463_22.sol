contract c12463{
    /**
     * @dev Overrides parent behavior by transferring tokens from wallet.
     * @param _beneficiary Token purchaser
     * @param _tokenAmount Amount of tokens purchased
     */
    function _deliverTokens(
        address _beneficiary,
        uint256 _tokenAmount
    )
    internal
    {
        token.transferFrom(tokenWallet, _beneficiary, _tokenAmount);
    }
}