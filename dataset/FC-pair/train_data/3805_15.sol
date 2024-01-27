contract c3805{
    /**
     * @notice Get Certification Document from DocType
     * @param _student - Address of student
     * @param _docIndx - Index of the document to be validated
     * @return Returns IPFSHash, ContentHash, TranscriptHash of the document
     **/
    function getCertificationDocument(address _student, uint _docIndx) public view onlyOwner returns (bytes, bytes32, bytes32) {
        return ((studentCertifications[_student].documents[_docIndx]).ipfsHash, (studentCertifications[_student].documents[_docIndx]).contentHash, (studentCertifications[_student].documents[_docIndx]).transcriptHash);
    }
}