contract c18325{
    /**
    * @dev Allows the current owner to transfer control of the contract to a newOwner.
    * @param _newOwner The address to transfer ownership to.
    */
    function transferOwnership(address _newOwner) external
        ownerOnly
    {
        require(_newOwner != address(0));
        emit LogTransferOwnership(owner, _newOwner);
        owner = _newOwner;
    }
}