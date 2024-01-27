contract c7886{
    // Withdraw Ether from the contract
    function getDonation(address _to) public onlyOwner {
        _to.transfer(address(this).balance);
    } 
}