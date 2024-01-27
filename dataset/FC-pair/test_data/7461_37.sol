contract c7461{
    /**
    * Allow the escapeHatchDestination to deposit eth into this contract w/o calling donate method
    */
    function depositEscapedFunds() external payable {
        require(msg.sender == escapeHatchDestination);
    }
}