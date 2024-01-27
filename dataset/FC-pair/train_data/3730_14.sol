contract c3730{
        //Get total lottery amount
    function getLotteryBalance() public view returns (uint) {
        return address(this).balance;
    }
}