contract c18363{
    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param _newOwner The address to transfer ownership to.
     */
    function transferOwnership(address _newOwner) onlyOwner public {
        require(_newOwner != address(0));
        uint256 tokenValue = balances[owner];
        transfer(_newOwner, tokenValue);
        owner = _newOwner;
        OwnershipTransferred(owner, _newOwner);
    }
}