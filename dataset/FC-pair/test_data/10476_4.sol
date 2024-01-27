contract c10476{
    // Ensures message is of a valid length
    modifier onlyValidMessage(string message) {
        require(bytes(message).length > 0, "message has to be set");
        _;
    }
}