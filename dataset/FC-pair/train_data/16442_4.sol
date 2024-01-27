contract c16442{
    // Lock Address
    function SetLockAddress(address a_aLockAddress, bool a_bStatus)
    external
    IsOwner
    {
        require(m_aOwner != a_aLockAddress);
        m_mLockAddress[a_aLockAddress] = a_bStatus;
        emit Locked(a_aLockAddress, a_bStatus);
    }
}