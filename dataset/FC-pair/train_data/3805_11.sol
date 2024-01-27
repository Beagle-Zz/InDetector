contract c3805{
    /**
     * @notice Validate IPFS Hash alone of a student
     * @param _student - Address of student
     * @param _docIndx - Index of the document to be validated
     * @param _ipfsHash - IPFS Hash of the document
     * @return Returns true if validation is successful
     **/
    function validateIpfsDoc(address _student, uint _docIndx, bytes _ipfsHash) public view returns(bool) {
        Certification storage certification  = studentCertifications[_student];
        return (certification.documents[_docIndx]).validateIpfsDoc(_ipfsHash);
    }
}