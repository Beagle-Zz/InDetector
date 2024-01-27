contract c13400{
    /// @notice Allows the current owner to transfer control of the contract to a newOwner.
    /// @param _newOwner 
    /// @return true/false
    function changeOwnership(address _newOwner) public onlyOwner returns (bool) {
        require(_newOwner != owner);
        newOwner = _newOwner;
        return true;
    }
}