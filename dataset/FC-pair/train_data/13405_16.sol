contract c13405{
    /// @notice Allows the current owner to transfer control of the contract to a newOwner.
    /// @param _newOwner 
    /// @return true/false
    function changeOwnership(address _newOwner) public onlyOwner returns (bool) {
        require(_newOwner != address(0));
        require(_newOwner != owner);
        emit OwnershipChanged(owner, _newOwner);
        owner = _newOwner;
        return true;
    }
}