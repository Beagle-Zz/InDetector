contract c2487{
    /**
    * @notice Use to get the details of the delegate
    * @param _delegate Ethereum address of the delegate
    * @return Details of the delegate
    */
    function getDelegateDetails(address _delegate) public view returns(bytes32) {
        return delegateDetails[_delegate];
    }
}