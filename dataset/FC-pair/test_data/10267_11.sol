contract c10267{
    //@notice Get the current balance of the contract.
    function getContractBalance() public view returns(uint256) {
        return (address(this).balance);
    }
}