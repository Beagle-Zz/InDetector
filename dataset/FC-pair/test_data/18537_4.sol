contract c18537{
    // Sets and clears mutex in order to block function reentry
    modifier preventReentry() {
        require(!__reMutex);
        __reMutex = true;
        _;
        delete __reMutex;
    }
}