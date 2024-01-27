contract c18625{
    /**
     * set systemAccount
     */
    function setFoundAcc(address _sysAcc) public onlyOwner returns (bool) {
        systemAcc = _sysAcc;
        SetFoundAcc(_sysAcc);
        return true;
    }
}