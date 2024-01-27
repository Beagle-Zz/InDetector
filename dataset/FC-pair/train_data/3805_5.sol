contract c3805{
    /**
     * @notice Validate Certification to a student
     * @param _ipfsHash - IPFS Hash of the document
     * @param _contentHash - Content Hash of the document
     * @param _transcriptHash - Transcript Hash of the document
     * @return Returns true if validation is successful
     **/
    function validate(Document storage self, bytes _ipfsHash, bytes32 _contentHash, bytes32 _transcriptHash) public view returns(bool) {
        bytes storage ipfsHash = self.ipfsHash;
        bytes32 contentHash = self.contentHash;
        bytes32 transcriptHash = self.transcriptHash;
        return contentHash == _contentHash && keccak256(ipfsHash) == keccak256(_ipfsHash) && transcriptHash == _transcriptHash;
    }
}