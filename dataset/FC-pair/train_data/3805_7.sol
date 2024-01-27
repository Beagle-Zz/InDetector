contract c3805{
    /**
     * @notice Validate Content Hash alone of a student
     * @param _contentHash - Content Hash of the document
     * @return Returns true if validation is successful
     **/
    function validateContentHash(Document storage self, bytes32 _contentHash) public view returns(bool) {
        bytes32 contentHash = self.contentHash;
        return contentHash == _contentHash;
    }
}