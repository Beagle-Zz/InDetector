contract c10343{
    /**
     * @dev Throws an exception if called not by owner or additional owner
     */
    modifier isOwnerOrAdditionalOwner() {
        require(msg.sender == owner || additionalOwners[msg.sender]);
        _;
    }
}