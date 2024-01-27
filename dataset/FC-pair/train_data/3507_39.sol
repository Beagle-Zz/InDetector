contract c3507{
    /**
     * @dev Function to mint tokens
     * @param _to The address that will receive the minted tokens.
     * @param _tokenId id of the new token
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address _to, uint256 _tokenId) onlyOwner canMint public {
        require(totalSupply().add(1) <= cap);
        return super.mint(_to, _tokenId);
    }
}