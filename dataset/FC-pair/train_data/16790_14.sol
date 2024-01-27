contract c16790{
	/* define who can transfer Tokens: owner and distributors */
    modifier canTransfer() {
        require(distributors[msg.sender] || msg.sender == owner);
        _;
    }
}