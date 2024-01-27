contract c16921{
    /// @dev Remove plugin and calls onRemove to cleanup
    function removePlugin(address _address) public onlyOwner
    {
        plugins[_address].onRemove();
        delete plugins[_address];
        uint256 kindex = 0;
        while (kindex < pluginsArray.length)
        {
            if (address(pluginsArray[kindex]) == _address)
            {
                pluginsArray[kindex] = pluginsArray[pluginsArray.length-1];
                pluginsArray.length--;
            }
            else
            {
                kindex++;
            }
        }
    }
}