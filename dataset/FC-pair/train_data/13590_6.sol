contract c13590{
    /**
    * @notice KYC validation function
    */
    function validateKYC(address _user, bool _flag) public onlyAdmin(1) {
        KYCValid[_user] = _flag;
    }
}