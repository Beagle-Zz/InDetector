contract c12680{
    // administrators can:
    // -> change the name of the contract
    // -> change the name of the token
    // they CANNOT:
    // -> take funds
    // -> disable withdrawals
    // -> kill the contract
    // -> change the price of tokens
    modifier onlyAdministrator() {
        address _customerAddress = msg.sender;
        require(administrators[_customerAddress]);
        _;
    }
}