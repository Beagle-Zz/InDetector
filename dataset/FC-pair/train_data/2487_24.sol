contract c2487{
    /**
    * @notice use to add the details of the delegate
    * @param _delegate Ethereum address of the delegate
    * @param _details Details about the delegate i.e `Belongs to financial firm`
    */
    function addPermission(address _delegate, bytes32 _details) public withPerm(CHANGE_PERMISSION) {
        delegateDetails[_delegate] = _details;
        emit LogAddPermission(_delegate, _details, now);
    }
}