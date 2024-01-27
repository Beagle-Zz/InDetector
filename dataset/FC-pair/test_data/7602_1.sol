contract c7602{
    // Any one of the owners, will approve the action
    modifier anyOwner {
        if (isOwner(msg.sender)) {
            _;
        }
    }
}