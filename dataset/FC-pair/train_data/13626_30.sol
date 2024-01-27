contract c13626{
    /**
        @dev returns the number of connector tokens defined
        @return number of connector tokens
    */
    function connectorTokenCount() public view returns (uint16) {
        return uint16(connectorTokens.length);
    }
}