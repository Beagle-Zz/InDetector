contract c8710{
    /**
     @dev Return number of restricted tokens from address
      @param _add The address to check restricted tokens
    */
    function restrictedTokensOf(address _add) public view returns(uint restrctedTokens) {
        return restrictedTokens[_add];
    }
}