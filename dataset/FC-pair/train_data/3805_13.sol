contract c3805{
    /**
     * @notice Validate Transcript Hash alone of a student
     * @param _student - Address of student
     * @param _transcriptHash - Transcript Hash of the GradeSheet
     * @return Returns true if validation is successful
     **/
    function validateTranscriptHash(address _student, uint _docIndx, bytes32 _transcriptHash) public view returns(bool) {
        Certification storage certification  = studentCertifications[_student];
        return (certification.documents[_docIndx]).validateTranscriptHash(_transcriptHash);
    }
}