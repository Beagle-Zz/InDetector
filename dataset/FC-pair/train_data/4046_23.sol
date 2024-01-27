contract c4046{
    /**
   * @dev Transfer all Ether held by the contract to the owner.
   */
    function reclaimEther() external onlyOwner {
        owner.transfer(address(this).balance);
    }
}