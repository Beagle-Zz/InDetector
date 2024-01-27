contract c3981{
    /**
     * @dev Overrides delivery by minting tokens upon purchase.
     * @param _beneficiary Token purchaser
     * @param _tokenAmount Number of tokens to be minted
     */
     function _deliverTokens(
        address _beneficiary,
        uint256 _tokenAmount)
     internal {
        require(token.mint(_beneficiary, _tokenAmount));
     }
}