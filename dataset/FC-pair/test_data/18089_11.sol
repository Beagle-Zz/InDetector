contract c18089{
    /**
     * @dev Set/remove token event listener
     * @param _listener Listener address (Contract must implement ITokenEventListener interface)
     */
    function setListener(address _listener) public onlyOwner {
        if(_listener != address(0)) {
            eventListener = ITokenEventListener(_listener);
        } else {
            delete eventListener;
        }
    }
}