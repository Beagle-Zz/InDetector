contract c4667{
    /**
    * @dev Function to set new allowed address
    * @param _newAllowed The address to allow
    */
    function SetAllow(address _newAllowed) onlyAdmin public {
        allowed = _newAllowed;
        emit SetAllowed(_newAllowed);
    }
}