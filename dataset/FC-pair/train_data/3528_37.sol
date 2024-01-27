contract c3528{
    // In case of accidental ether lock on contract
    function withdraw() public onlyOwner {
        owner.transfer(address(this).balance);
    }
}