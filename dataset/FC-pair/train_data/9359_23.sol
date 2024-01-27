contract c9359{
    // functions below this line are onlyController
    modifier onlyController() {
        require(msg.sender == address(controller));
        _;
    }
}