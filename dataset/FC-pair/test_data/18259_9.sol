contract c18259{
    /**
     * @dev Function to set owners addresses
     */
    function setOwners(address[] _owners) public {
        require(msg.sender == manager);
        _setOwners(_owners);
    }
}