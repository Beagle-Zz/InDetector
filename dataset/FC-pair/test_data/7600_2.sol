contract c7600{
    // Requiring num > m_multiRequires owners, to approve the action
    modifier mostOwner(bytes32 operation) {
        if (checkAndConfirm(msg.sender, operation)) {
            _;
        }
    }
}