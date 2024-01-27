contract c13161{
//@dev make sure that the recipient address is notNull
    modifier notNull(address _to) {
        require(_to != address(0));
        _;
    }
}