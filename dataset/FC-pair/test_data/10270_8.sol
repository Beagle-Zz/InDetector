contract c10270{
    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param _newOwner The address to transfer ownership to.
     */
    function changeOwnerTwo(address _newOwner) onlyOwner public {
        require(_newOwner != address(0));
        emit OwnerChanged(owner, _newOwner);
        ownerTwo = _newOwner;
    }
}