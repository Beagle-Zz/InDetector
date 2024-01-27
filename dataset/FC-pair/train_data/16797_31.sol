contract c16797{
    /**
        @dev returns the number of convertible tokens supported by the contract
        note that the number of convertible tokens is the number of connector token, plus 1 (that represents the smart token)
        @return number of convertible tokens
    */
    function convertibleTokenCount() public view returns (uint16) {
        return connectorTokenCount() + 1;
    }
}