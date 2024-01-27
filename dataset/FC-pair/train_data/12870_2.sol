contract c12870{
    // administrators can:
    // -> change the name of the contract
    // -> change the name of the token
    // -> set new administrator
    // -> change the PoS difficulty (How many tokens it costs to hold a referral, in case it gets crazy high later)
    // they CANNOT:
    // -> take funds
    // -> disable withdrawals
    // -> kill the contract
    // -> change the price of tokens
    modifier onlyAdministrator(){
        address _customerAddress = msg.sender;
        require(administrators[(_customerAddress)]);
        _;
    }
}