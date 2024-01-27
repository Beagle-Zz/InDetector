contract c13837{
    // Get the amount of purchased eggs of a struct
    function getPurchased(uint256 _eggId) external view returns(uint256){
        return eggs[_eggId].purchased;
    }
}