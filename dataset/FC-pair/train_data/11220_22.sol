contract c11220{
    // Set whether _to is on the list or not. Whether 0x0 is on the list
    // or not cannot be set here - it is set once and for all by the constructor.
    function changeList(address _to, bool _onList) onlyOwner public {
        require(_to != 0x0);
        if (onList[_to] != _onList) {
            onList[_to] = _onList;
            ChangeWhiteList(_to, _onList);
        }
    }
}