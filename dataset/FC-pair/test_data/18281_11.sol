contract c18281{
    // -----------------------------------------
    // Internal interface (extensible)
    // -----------------------------------------
    //Assertain the validity of the transfer
    function _preValidateTokenTransfer(address _beneficiary, uint256 _tokenAmount) internal pure {
        require(_beneficiary != address(0));
        require(_tokenAmount > 0);
    }
}