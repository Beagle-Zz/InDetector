contract c8669{
    /**
     * @dev Adds authorized to execute several functions to subOwner.
     * @param _authorized The address to add authorized to.
     */
    function addAuthorized(address _authorized) onlyOwner public {
      authorized[_authorized] = true;
      emit AuthorizedAdded(_authorized);
    }
}