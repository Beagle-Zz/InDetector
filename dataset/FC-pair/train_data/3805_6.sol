contract c3805{
    /**
     * @notice Validate IPFS Hash alone of a student
     * @param _ipfsHash - IPFS Hash of the document
     * @return Returns true if validation is successful
     **/
    function validateIpfsDoc(Document storage self, bytes _ipfsHash) public view returns(bool) {
        bytes storage ipfsHash = self.ipfsHash;
        return keccak256(ipfsHash) == keccak256(_ipfsHash);
    }
}