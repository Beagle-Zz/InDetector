contract c13407{
    /// @notice set address of token porter
    /// @param _tokenPorter address of token porter
    function setTokenPorter(address _tokenPorter) public onlyOwner returns (bool) {
        require(_tokenPorter != 0x0);
        tokenPorter = ITokenPorter(_tokenPorter);
        return true;
    }
}