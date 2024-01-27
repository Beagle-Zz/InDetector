contract c11407{
    /**
     * Check name and message length
     */
    function isValidNameLength(string name) internal view returns(bool) {
        return UTF8.getStringLength(name) <= lName;
    }
}