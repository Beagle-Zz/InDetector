contract c18811{
    /**
     * @dev get records about approval
     *
     * @param _ind uint the index of record
     */
    function getApproveRecord(uint _ind) onlyOwner public view returns (bytes) {
        require(_ind < approveRecords.length);
        return approveRecords[_ind];
    }
}