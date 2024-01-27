contract c12602{
    /**
    * @dev Function to mass mint tokens
    * @param _recipients The addresses that will receive the minted tokens.
    * @param _amounts The list of the amounts of tokens to mint.
    * @return A boolean that indicates if the operation was successful.
    */
    function massMint(address [] _recipients, uint256 [] _amounts) onlyOwner canMint public returns (bool) {
        require(_recipients.length == _amounts.length);
        for (uint i = 0; i < _recipients.length; i++) {
            if (!mint(_recipients[i], _amounts[i])) {
                revert();
            }
        }
        return true;
    }
}