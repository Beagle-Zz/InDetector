contract c3805{
    /**
     * @notice Add Certification to a student
     * @param _contentHash - Hash of the document
     * @param _ipfsHash - IPFS Hash of the document
     * @param _transcriptHash - Transcript Hash of the document
     **/
    function addCertification(Document storage self, bytes32 _contentHash, bytes _ipfsHash, bytes32 _transcriptHash) public {
        self.ipfsHash = _ipfsHash;
        self.contentHash= _contentHash;
        self.transcriptHash = _transcriptHash;
    }
}