contract c13409{
    /// @notice export MET tokens from this chain to another chain.
    /// @param _destChain destination chain address
    /// @param _destMetronomeAddr address of Metronome contract on the destination chain 
    /// where this MET will be imported.
    /// @param _destRecipAddr address of account on destination chain
    /// @param _amount amount
    /// @param _extraData extra information for future expansion
    /// @return true/false
    function export(bytes8 _destChain, address _destMetronomeAddr, address _destRecipAddr, uint _amount, uint _fee, 
    bytes _extraData) public returns (bool)
    {
        require(address(tokenPorter) != 0x0);
        return tokenPorter.export(msg.sender, _destChain, _destMetronomeAddr,
        _destRecipAddr, _amount, _fee, _extraData);
    }
}