contract c18474{
    // Allows owner to withdraw ether from the contract
    function withdrawEther(address to) public onlyOwner {
        to.transfer(address(this).balance);
    }
}