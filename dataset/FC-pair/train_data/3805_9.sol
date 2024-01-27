contract c3805{
    /**
     * @notice Add Certification to a student
     * @param _student - Address of student
     * @param _contentHash - Hash of the document
     * @param _ipfsHash - IPFS Hash of the document
     * @param _transcriptHash - Transcript Hash of the document
     **/
    function addCertification(address _student, bytes32 _contentHash, bytes _ipfsHash, bytes32 _transcriptHash) public onlyOwner {
        uint currIndx = studentCertifications[_student].indx;
        (studentCertifications[_student].documents[currIndx]).addCertification(_contentHash, _ipfsHash, _transcriptHash);
        studentCertifications[_student].indx++;
        emit CertificationAdded(_student, currIndx);
    }
}