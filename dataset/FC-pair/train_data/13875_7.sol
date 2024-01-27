contract c13875{
    // Get amount of Shrimps user has
    function getMyShrimp() public view returns(uint256){
        return hatcheryShrimp[msg.sender];
    }
}