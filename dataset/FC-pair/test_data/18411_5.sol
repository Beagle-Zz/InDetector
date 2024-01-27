contract c18411{
    /** Can be called once by super owner. */
    function unlock() onlyOwner public {
        require(locked);
        locked = false;
        Unlock();
    }
}