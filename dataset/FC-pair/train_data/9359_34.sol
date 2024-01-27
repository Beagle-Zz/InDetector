contract c9359{
    // functions below this line are onlyController
    modifier onlyController() {
        assert(msg.sender == address(controller));
        _;
    }
}