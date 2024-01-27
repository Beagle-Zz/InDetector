contract c10134{
    //owner draw _money
    function withdraw() external onlyOwner {
        owner.transfer(address(this).balance);
    }
}