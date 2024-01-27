contract c7554{
    /// @dev gives the owner the possibility to put the Interface into an emergencyMode, which will 
    /// output always a price of 600 USD. This gives everyone time to set up a new pricefeed.
    function raiseEmergency(bool _emergencyMode)
        public
        onlyOwner()
    {
        emergencyMode = _emergencyMode;
    }
}