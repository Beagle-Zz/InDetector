contract c7461{
    /// @dev In this 2nd option for ownership transfer `changeOwnership()` can
    ///  be called and it will immediately assign ownership to the `newOwner`
    /// @notice `owner` can step down and assign some other address to this role
    /// @param _newOwner The address of the new owner
    function changeOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != 0x0);
        address oldOwner = owner;
        owner = _newOwner;
        newOwnerCandidate = 0x0;
        OwnershipTransferred(oldOwner, owner);
    }
}