contract c10549{
    /**
     * Dispatcher can change user balance
     */
    function addServiceReward(uint _amount) external onlyDispatcher {
        serviceReward += _amount;
    }
}