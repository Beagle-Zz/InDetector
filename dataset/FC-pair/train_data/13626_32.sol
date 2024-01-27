contract c13626{
    /**
        @dev given a convertible token index, returns its contract address
        @param _tokenIndex  convertible token index
        @return convertible token address
    */
    function convertibleToken(uint16 _tokenIndex) public view returns (address) {
        if (_tokenIndex == 0)
            return token;
        return connectorTokens[_tokenIndex - 1];
    }
}