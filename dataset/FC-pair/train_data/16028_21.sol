contract c16028{
    /**
     * @dev Set a mint agent address
     * 
     * @param _addr  address  The address that will receive the minted tokens.
     * @param _state bool     The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function setMintAgent(address _addr, bool _state) onlyOwner public returns (bool) {
        mintAgents[_addr] = _state;
        emit MintAgentChanged(_addr, _state);
        return true;
    }
}