contract c7358{
    /**
    * @dev withdraw allows the owner of the contract to withdraw all ether collected by bell ringers
    */
    function collect() external onlyOwner {
        owner.transfer(address(this).balance);
    }
}