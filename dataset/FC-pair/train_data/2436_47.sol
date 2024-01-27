contract c2436{
    /*
    bytes4(keccak256('exists(uint256)'));
    */
    /**
    * @notice Introspection interface as per ERC-165 (https://github.com/ethereum/EIPs/issues/165).
    * @dev Returns true for any standardized interfaces implemented by this contract.
    * @param _interfaceID bytes4 the interface to check for
    * @return true for any standardized interfaces implemented by this contract.
    */
    function supportsInterface(bytes4 _interfaceID) external view returns (bool)
    {
        return ((_interfaceID == InterfaceSignature_ERC165)
        || (_interfaceID == InterfaceSignature_ERC721)
        || (_interfaceID == InterfaceSignature_ERC721Enumerable)
        || (_interfaceID == InterfaceSignature_ERC721Metadata));
    }
}