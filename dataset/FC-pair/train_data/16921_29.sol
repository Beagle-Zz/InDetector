contract c16921{
    /// @dev Put a cutie up for plugin feature.
    function runPlugin(
        address _pluginAddress,
        uint40 _cutieId,
        uint256 _parameter
    )
        public
        whenNotPaused
        payable
    {
        // If cutie is already on any auction or in adventure, this will throw
        // because it will be owned by the other contract.
        // If _cutieId is 0, then cutie is not used on this feature.
        require(_cutieId == 0 || _isOwner(msg.sender, _cutieId));
        require(address(plugins[_pluginAddress]) != address(0));
        if (_cutieId > 0)
        {
            _approve(_cutieId, _pluginAddress);
        }
        // Plugin contract throws if inputs are invalid and clears
        // transfer after escrowing the cutie.
        plugins[_pluginAddress].run.value(msg.value)(
            _cutieId,
            _parameter,
            msg.sender
        );
    }
}