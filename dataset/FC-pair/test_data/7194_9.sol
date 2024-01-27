contract c7194{
    /**
     * @dev Set Description
     * 
     * @param _description string
     */
    function setDescription(string _description) external onlyOwner {
        description = _description;
    }
}