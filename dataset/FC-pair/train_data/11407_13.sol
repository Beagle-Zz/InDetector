contract c11407{
    /**
     * Delete star
     */
    function deleteStar(uint256 starId) external payable {
        // Exists and owned star
        require(starExists(starId));
        require(isStarOwner(starId, msg.sender));
        // Get star update price
        uint256 commission = getCommission(stars[starId].price);
        require(isValidMsgValue(commission));
        // Update star data
        setStarDeleted(starId);
        emit StarDeleted(starId, msg.sender);
    }    
}