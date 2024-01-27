contract c7581{
    /**
     * @notice Set the address of the user/contract responsible for collecting or
     * distributing fees.
     */
    function setFeeAuthority(address _feeAuthority)
        public
        optionalProxy_onlyOwner
    {
        feeAuthority = _feeAuthority;
        emitFeeAuthorityUpdated(_feeAuthority);
    }
}