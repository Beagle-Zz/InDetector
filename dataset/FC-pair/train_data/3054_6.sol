contract c3054{
    // show how much profit has been made (houseEdge)
    function private_profits() public view onlyOwner returns(uint256) {
        return totalProfit;
    }
}