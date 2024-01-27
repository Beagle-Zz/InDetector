contract c16407{
    /**
    * @dev Connect to Founder contract so user can pay in FCF
    */
    function setFcfContractAddress(address _address) external contract_onlyOwner returns (bool success) {
        fcfContract = FcfInterface(_address);
        return true;
    }
}