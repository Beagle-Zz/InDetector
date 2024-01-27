contract c13409{
    /// @notice set address of token porter
    /// @param _tokenPorter address of token porter
    function setTokenPorter(address _tokenPorter) public onlyOwner returns (bool) {
        require(_tokenPorter != 0x0);
        tokenPorter = _tokenPorter;
        return true;
    }
}