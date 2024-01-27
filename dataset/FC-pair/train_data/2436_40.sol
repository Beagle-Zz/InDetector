contract c2436{
    /**
    * @dev Internal function to set the token URI for a given token
    * @dev Reverts if the token ID does not exist
    * @param _uri string URI to assign
    */
    function _setTokenURIBase(string _uri) internal {
        tokenURIBase = _uri;
    }
}