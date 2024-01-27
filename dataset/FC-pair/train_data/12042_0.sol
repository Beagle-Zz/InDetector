contract c12042{
   /**
    * @dev Function to set an allowed address
    * @param _to The address to give privileges.
    */
    function setAllowedAddress(address _to) onlyAdmin public {
        allowedAddress = _to;
        emit AllowedSet(_to);
    }
}