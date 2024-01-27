contract c18970{
    /**
    * @dev Throws if called by any account other than the icoContract.
    */
    modifier onlyIcoContract() {
        require(msg.sender == icoContractAddress);
        _;
    }
}