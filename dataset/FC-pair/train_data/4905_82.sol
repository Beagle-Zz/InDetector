contract c4905{
    /// @notice Init function for ATxAsset.
    ///
    /// @param _proxy - atx asset proxy.
    /// @param _serviceController - service controoler.
    /// @param _dataController - data controller.
    /// @param _lockupDate - th lockup date.
    function initAtx(
        address _proxy, 
        address _serviceController, 
        address _dataController, 
        uint _lockupDate
    ) 
    onlyContractOwner 
    public 
    returns (bool) 
    {
        require(_serviceController != 0x0);
        require(_dataController != 0x0);
        require(_proxy != 0x0);
        require(_lockupDate > now || _lockupDate == 0);
        if (!super.init(ATxProxy(_proxy))) {
            return false;
        }
        serviceController = ServiceController(_serviceController);
        dataController = DataController(_dataController);
        lockupDate = _lockupDate;
        return true;
    }
}