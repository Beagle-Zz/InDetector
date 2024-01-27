contract c12426{
    /** @dev Function which set the activator of the cycle.
      * Only owner can call the function.
      */
    function setActivator(address _newActivator) onlyOwner public returns(bool) {
        require(activator[_newActivator] == false);
        activator[_newActivator] = true;
        return activator[_newActivator];
    }
}