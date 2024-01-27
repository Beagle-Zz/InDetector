contract c18918{
    // Internal utility functions: These functions all assume that their input arguments
    // are valid. We leave it to public methods to sanitize their inputs and follow
    // the required logic.
    /// @dev Checks if a given address is the current owner of a particular Rabbit.
    /// @param _owner the address we are validating against.
    /// @param _tokenId rabbit id, only valid when > 0
    function _owns(address _owner, uint _tokenId) internal view returns (bool) {
        return rabbitToOwner[_tokenId] == _owner;
    }
}