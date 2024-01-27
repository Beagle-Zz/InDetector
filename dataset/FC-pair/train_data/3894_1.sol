contract c3894{
    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param _newOwner The address to transfer ownership to.
     */
    function transferOwnership(address _newOwner) public onlyOwner returns (bool) {
        if (_newOwner != address(0)) {
            onTransferOwnership(owner, _newOwner);
            owner = _newOwner;
        }
        return true;
    }
}