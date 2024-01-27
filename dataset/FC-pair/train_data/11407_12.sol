contract c11407{
    /**
     * Update start method
     */
    function updateStar(uint256 starId, string name, string message) external payable {
        // Exists and owned star
        require(starExists(starId));
        require(isStarOwner(starId, msg.sender));
        // Check basic requires
        require(isValidNameLength(name));
        require(isValidMessageLength(message));        
        // Get star update price
        uint256 commission = getCommission(stars[starId].price);
        require(isValidMsgValue(commission));
        // Update star
        setStarNameMessage(starId, name, message);
        emit StarUpdated(starId, 1);
    }    
}