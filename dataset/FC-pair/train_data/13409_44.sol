contract c13409{
    /// @notice send ETH and get MET
    /// @param _mintReturn execute conversion only if return is equal or more than _mintReturn
    /// @return returnedMet MET retured after conversion
    function convertEthToMet(uint _mintReturn) public payable returns (uint returnedMet) {
        returnedMet = convert(WhichToken.Eth, _mintReturn, msg.value);
        emit ConvertEthToMet(msg.sender, msg.value, returnedMet);
    }
}