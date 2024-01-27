contract c2139{
    /*
        @dev Get the withdrawalCoolingPeriod parameter value. 
     */
    function getWithdrawalCoolingPeriod() external view returns(uint) {
        return withdrawalCoolingPeriod;
    }
}