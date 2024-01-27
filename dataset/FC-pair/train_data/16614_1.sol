contract c16614{
    // business use only for owner
    modifier ensureOwner() {
        require(
            msg.sender == owner
        );
        _;
    }
}