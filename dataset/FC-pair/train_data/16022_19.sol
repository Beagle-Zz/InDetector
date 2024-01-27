contract c16022{
    /**
     * @dev Set Info
     * 
     * @param _description string
     * @param _website string
     * @param _email string
     */
    function setInfo(string _description, string _website, string _email) external onlyOwner returns (bool) {
        description = _description;
        website = _website;
        email = _email;
        return true;
    }
}