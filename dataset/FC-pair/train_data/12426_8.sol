contract c12426{
    /** @dev Function which remove the activator.
      * Only owner can call the function.
      */
    function removeActivator(address _Activator) onlyOwner public returns(bool) {
        require(activator[_Activator] == true);
        activator[_Activator] = false;
        return true;
    }
}