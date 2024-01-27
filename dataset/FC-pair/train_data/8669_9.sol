contract c8669{
    /**
     * @dev Removes authorized to execute several functions from subOwner.
     * @param _authorized The address to remove authorized from.
     */
    function removeAuthorized(address _authorized) onlyOwner public {
      authorized[_authorized] = false;
      emit AuthorizedRemoved(_authorized);
    }
}