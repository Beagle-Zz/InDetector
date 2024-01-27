contract c4003{
    // Check whether msg.sender can transfer token or not
    modifier validTransfer() {
        if (locked && lockAccount[msg.sender])
            revert();
        _;
    }
}